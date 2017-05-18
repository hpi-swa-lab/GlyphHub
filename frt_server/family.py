from sqlalchemy import Column, String, inspect, Integer, ForeignKey, Enum, Text, event
from sqlalchemy.orm import relationship

from frt_server.common import CommonColumns, DATE_FORMAT
from frt_server.font import Font
from frt_server.tag import tag_family_association_table
import frt_server.config

import os
import glob
import subprocess
import shutil
import zipfile
import enum
import pygit2
import datetime

from werkzeug.utils import secure_filename

class FamilyUploadStatus(enum.IntEnum):
    ready_for_upload = 1
    uploading = 2
    processing = 3

class Family(CommonColumns):
    __tablename__ = 'family'
    family_name = Column(String(300))
    preview_glyphs = Column(String(500), default='')
    upload_status = Column(Enum(FamilyUploadStatus))
    last_upload_error = Column(Text)
    fonts = relationship('Font', back_populates='family')
    tags = relationship('Tag', secondary=tag_family_association_table)
    standard_sample_text = relationship('SampleText', back_populates='families')
    standard_sample_text_id = Column(Integer, ForeignKey('sample_text._id'))

    def delete_family_if_empty(family):
        if not family.fonts:
            session = inspect(family).session
            session.delete(family)
            session.commit()

    def is_glyphs_file(self, filename):
        return filename.endswith('.glyphs')

    def is_ufo_file(self, filename):
        return filename.endswith('.ufo.zip')

    def source_folder_path(self):
        """Path to the folder containing all the family sources"""
        return os.path.join(frt_server.config.FAMILY_UPLOAD_FOLDER, str(self._id))

    def ensure_source_folder_exists(self):
        """Ensure that the folder at source_folder_path exists"""
        folder = self.source_folder_path()
        if not os.path.exists(folder):
            os.makedirs(folder)
            self.repo = pygit2.init_repository(folder)
        else:
            self.repo = pygit2.Repository(folder)

    def clean_folders(self):
        """Delete all our associated folders"""
        if os.path.exists(self.source_folder_path()):
            shutil.rmtree(self.source_folder_path())

    def unzip_file(self, filename):
        with zipfile.ZipFile(os.path.join(self.source_folder_path(), filename), "r") as ufo_zip_file:
            ufo_zip_file.extractall(self.source_folder_path())

    def convert_font_after_upload(self, filename):
        """invoke fontmake in our source folder. no cleanup performed after"""
        type_parameter = None
        if self.is_glyphs_file(filename):
            type_parameter = "-g"
            temporary_filename = filename
        elif self.is_ufo_file(filename):
            self.unzip_file(filename)
            temporary_filename = filename[:-4]
            folders = glob.glob(os.path.join(self.source_folder_path(), '*.ufo'))
            if len(folders) != 1:
                raise Error(self.source_folder_path() + " should contain exactly 1 match for *.ufo, but contains " + len(folders))
            source = os.path.join(self.source_folder_path(), folders[0])
            destination = os.path.join(self.source_folder_path(), temporary_filename)
            if source != destination:
                self.move_file(source, destination)
            type_parameter = "-u"
        else:
            raise Exception("Exception: File is neither .ufo nor .glyphs")

        fontmake_result = subprocess.run(['fontmake', type_parameter, temporary_filename, '--no-production-names', '-o', 'otf', '--verbose', 'CRITICAL'],
                cwd=self.source_folder_path())
        if fontmake_result.returncode != 0:
            raise Exception("Exception: Fontmake failed to compile a font")

    def font_for_file_named(self, ufo_filename):
        """check if an ufo file with that name already exists and return the associated font if it does"""
        for font in self.fonts:
            if font.ufo_file_path().endswith(ufo_filename):
                return font

    def create_uploaded_font(self, font_name, ufo_filename, otf_filename, user):
        font = self.font_for_file_named(ufo_filename)
        if font:
            return font

        font = Font(font_name=font_name, author_id=user._id)
        self.fonts.append(font)
        session = inspect(self).session
        session.commit()
        session.refresh(font)

        font.clean_folders()
        font.ensure_folder_exists()
        return font

    def process_file(self, family_file, user, commit_message):
        """convert a glyphs or ufo file to (ufo and) otf, create all associated Font entities, move files to the right folders
        we get:
        family/3/sourceFile.glyphs
        family/3/fonts/7/ufo/myFont.ufo
        family/3/fonts/7/otf/myFont.otf"""

        sanitized_filename = secure_filename(os.path.basename(family_file.filename))
        if not sanitized_filename:
            raise Exception("Exception: Filename is invalid.")

        self.ensure_source_folder_exists()
        family_file.save(os.path.join(self.source_folder_path(), sanitized_filename))
        try:
            self.convert_font_after_upload(sanitized_filename)
        except:
            raise

        source_otf_path = os.path.join(self.source_folder_path(), 'master_otf')

        otf_filenames = [os.path.basename(filename) for filename in glob.glob(source_otf_path + '/*.otf')]
        if len(otf_filenames) < 1:
            raise FileNotFoundError('No otf files were generated')

        if self.is_ufo_file(sanitized_filename):
            self.process_ufo_file(sanitized_filename[:-4], otf_filenames[0], user)
        else:
            self.process_glyphs_file(sanitized_filename, otf_filenames, user)

        self.create_commit(commit_message, user)

    def process_glyphs_file(self, glyphs_filename, otf_filenames, user):
        source_otf_path = os.path.join(self.source_folder_path(), 'master_otf')
        source_ufo_path = os.path.join(self.source_folder_path(), 'master_ufo')

        for otf_filename in otf_filenames:
            font_name = otf_filename[:-4]
            ufo_filename = font_name + '.ufo'
            font = self.create_uploaded_font(font_name, ufo_filename, otf_filename, user)

            self.move_file(os.path.join(source_ufo_path, ufo_filename), os.path.join(font.ufo_folder_path(), ufo_filename))
            self.move_file(os.path.join(source_otf_path, otf_filename), os.path.join(font.otf_folder_path(), otf_filename))

        shutil.rmtree(source_ufo_path)
        shutil.rmtree(source_otf_path)

    def process_ufo_file(self, ufo_filename, otf_filename, user):
        source_otf_path = os.path.join(self.source_folder_path(), 'master_otf')
        font_name = otf_filename[:-4]

        font = self.create_uploaded_font(font_name, ufo_filename, otf_filename, user)

        self.move_file(os.path.join(self.source_folder_path(), ufo_filename), os.path.join(font.ufo_folder_path(), ufo_filename))
        self.move_file(os.path.join(source_otf_path, otf_filename), os.path.join(font.otf_folder_path(), otf_filename))

        shutil.rmtree(source_otf_path)

    def move_file(self, source, destination):
        if os.path.exists(destination):
            if (os.path.isdir(destination)):
                shutil.rmtree(destination)
            else:
                os.remove(destination)
        shutil.move(source, destination)

    def create_commit(self, message, user):
        self.ensure_source_folder_exists()

        index = self.repo.index
        index.add_all()

        treeId = index.write_tree(self.repo)
        author = pygit2.Signature(user.username, user.email)

        parents = [] if self.repo.head_is_unborn else [self.repo.head.target]

        self.repo.create_commit('HEAD', author, author, message, treeId, parents)

    def versions(self):
        self.ensure_source_folder_exists()
        if self.repo.head_is_unborn:
            return []

        return list(map(lambda entry: {
                'version_hash': str(entry.id),
                'message': entry.message,
                'datetime': datetime.datetime.fromtimestamp(entry.commit_time).strftime(DATE_FORMAT)
            }, self.repo.walk(self.repo.head.target)))

    def _repo(self):
        """return the internal pygit2 repo object"""
        self.ensure_source_folder_exists()
        return self.repo

@event.listens_for(Family, 'load')
def after_font_load(target, context):
    target.version_messages = target.versions()

