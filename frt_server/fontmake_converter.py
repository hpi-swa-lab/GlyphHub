import os
import subprocess
import zipfile
import shutil
import glob
import threading
import plistlib

from sqlalchemy import inspect
from frt_server.font import Font
from frt_server.common import FamilyUploadStatus

def convert(source_filename, family, user, commit_message):
    if source_filename.endswith('.glyphs'):
        uploader = GlyphsUploadHandler()
    else:
        uploader = UfoUploadHandler()

    uploader.upload(source_filename, family, user, commit_message)

class FontSourceConvertError(Exception):
    """something went wrong while invoking fontmake on the given font source"""

class UploadHandler:

    error = None
    error_lock = threading.Lock()

    def mark_begin_upload(self, family):
        family.upload_status = FamilyUploadStatus.processing
        family.last_upload_error = None
        self.session.add(family)
        self.session.commit()

    def mark_end_upload(self, family, error=None):
        family.upload_status = FamilyUploadStatus.ready_for_upload
        family.last_upload_error = error
        self.session.add(family)
        self.session.commit()

    def upload(self, source_filename, family, user, commit_message):
        self.session = inspect(family).session

        try:
            self.mark_begin_upload(family)

            # convert sources to ufo
            try:
                ufo_folders = self.unpack_uploaded_file(source_filename, family)
            except FontSourceConvertError as e:
                self.error = e
                raise

            # create/fetch font entities and place ufos in their folders
            fonts = [self.prepare_font_entity_for_ufo_name(ufo_folder, family, user)
                    for ufo_folder in ufo_folders]

            # make a commit over that
            self.session.add(family)
            self.session.refresh(family)
            version_hash = family.create_commit(commit_message, user)

            # change fontname to include commit hash and generate otfs based on that
            threads = []
            for font in fonts:
                font_name = self.append_version_to_ufo_fontname(font.ufo_file_path(), version_hash)
                thread = threading.Thread(target=self.convert_ufo_to_otf, args=[font])
                thread.start()
                threads.append(thread)

            for thread in threads:
                thread.join()

            if self.error:
                raise

            self.clean_after_upload(family)
        except FontSourceConvertError:
            pass
        except:
            raise
        finally:
            try:
                # remove the version hashes from the fontnames again
                family.reset_working_copy()
            except:
                pass

            if self.error:
                if self.error is FontSourceConvertError:
                    error_message = error.message
                else:
                    error_message = 'Something went wrong during the convertion process.'
            else:
                error_message = None
            self.mark_end_upload(family, error_message)

    def unpack_uploaded_file(self, source_filename, family):
        """unpack the uploaded source file and return a list of resulting ufo folder names"""
        pass

    def font_name_from_ufo(self, ufo_folder):
        with open(os.path.join(ufo_folder, 'fontinfo.plist'), 'rb') as fontinfo_file:
            return plistlib.load(fontinfo_file)['familyName']

    def prepare_font_entity_for_ufo_name(self, ufo_folder, family, user):
        font = family.font_for_file_named(ufo_folder)
        if font:
            return font

        font = Font(font_name=self.font_name_from_ufo(ufo_folder), author_id=user._id)
        family.fonts.append(font)
        self.session.commit()
        self.session.refresh(font)

        font.clean_folders()
        font.ensure_folder_exists()
        self.move_ufo_to_font_folder(ufo_folder, font)
        return font

    def move_ufo_to_font_folder(self, ufo_folder_name, font):
        self.move_file(ufo_folder_name, os.path.join(font.ufo_folder_path(), os.path.basename(ufo_folder_name)))

    def append_version_to_ufo_fontname(self, ufo_folder, commit_hash):
        with open(os.path.join(ufo_folder, 'fontinfo.plist'), 'rb') as fontinfo_file:
            fontinfo = plistlib.load(fontinfo_file)
            fontinfo['familyName'] += ' ' + commit_hash
            fontinfo['styleMapFamilyName'] += ' ' + commit_hash
            fontinfo['openTypeNamePreferredFamilyName'] += ' ' + commit_hash

        with open(os.path.join(ufo_folder, 'fontinfo.plist'), 'wb') as fontinfo_file:
            plistlib.dump(fontinfo, fontinfo_file)
            return fontinfo['familyName']

    def convert_ufo_to_otf(self, font):
        try:
            process = subprocess.Popen(['fontmake', '-u', font.ufo_file_path(), '--no-production-names', '-o', 'otf', '--verbose', 'CRITICAL'],
                    shell=False,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    cwd=font.folder_path())
            stdout, stderr = process.communicate()

            if process.returncode != 0:
                raise FontSourceConvertError('fontmake failed to convert your font to otf: ' + str(stderr))

            source_otf_path = os.path.join(font.folder_path(), 'master_otf')

            otf_filename = [os.path.basename(filename) for filename in glob.glob(source_otf_path + '/*.otf')][0]
            self.move_file(os.path.join(source_otf_path, otf_filename), font.otf_file_path_for_creating())

            shutil.rmtree(source_otf_path)
        except Exception as e:
            self.error_lock.acquire()
            error = e.message
            self.error_lock.release()

    def clean_after_upload(self, family):
        pass

    def move_file(self, source, destination):
        """move source to destination. if destination already exists, delete it beforehand"""
        if os.path.exists(destination):
            if (os.path.isdir(destination)):
                shutil.rmtree(destination)
            else:
                os.remove(destination)
        shutil.move(source, destination)

class UfoUploadHandler(UploadHandler):
    def unpack_uploaded_file(self, source_filename, family):
        self.unzip_file_for_family(family, source_filename)
        return [filename for filename in glob.glob(family.source_folder_path() + '/*.ufo')]

    def unzip_file_for_family(self, family, filename):
        with zipfile.ZipFile(os.path.join(family.source_folder_path(), filename), "r") as ufo_zip_file:
            ufo_zip_file.extractall(family.source_folder_path())

class GlyphsUploadHandler(UploadHandler):
    def unpack_uploaded_file(self, source_filename, family):
        process = subprocess.Popen(['fontmake', '-g', source_filename, '--no-production-names', '-o', 'ufo', '--verbose', 'CRITICAL'],
                shell=False,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                cwd=family.source_folder_path())
        stdout, stderr = process.communicate()
        if process.returncode != 0:
            raise FontSourceConvertError('fontmake failed to convert your font to ufo: ' + str(stderr))

        source_ufo_path = os.path.join(family.source_folder_path(), 'master_ufo')
        return [filename for filename in glob.glob(source_ufo_path + '/*.ufo')]

    def clean_after_upload(self, family):
        super().clean_after_upload(family)
        shutil.rmtree(os.path.join(family.source_folder_path(), 'master_ufo'))
