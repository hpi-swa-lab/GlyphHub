from sqlalchemy import Column, String
from sqlalchemy.orm import relationship

from frt_server.common import CommonColumns
from frt_server.font import Font
import frt_server.config

import os
import glob
import subprocess
import shutil
import zipfile

from werkzeug.utils import secure_filename

class Family(CommonColumns):
    __tablename__ = 'family'
    family_name = Column(String(300))
    fonts = relationship('Font', back_populates='family')

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

    def unzip_file(self, filename):
        with zipfile.ZipFile(os.path.join(self.source_folder_path(), filename), "r") as ufo_zip_file:
            ufo_zip_file.extractall(self.source_folder_path())

    def convert_font_after_upload(self, filename):
        """invoke fontmake in our source folder. no cleanup performed after"""
        type_parameter = None
        if self.is_glyphs_file(filename):
            type_parameter = "-g"
            temporary_filename = filename
        if self.is_ufo_file(filename):
            self.unzip_file(filename)
            temporary_filename = filename[:-4]
            type_parameter = "-u"

        subprocess.run(['fontmake', type_parameter, temporary_filename, '--no-production-names', '-o', 'otf', '--verbose', 'CRITICAL'],
                cwd=self.source_folder_path())

    def process_file(self, family_file, app, user):
        """convert a glyphs file to ufo and otf, create all associated Font entities"""
        session = app.data.driver.session
        sanitized_filename = secure_filename(os.path.basename(family_file.filename))

        self.ensure_source_folder_exists()
        family_file.save(os.path.join(self.source_folder_path(), sanitized_filename))
        self.convert_font_after_upload(sanitized_filename)

        if self.is_ufo_file(sanitized_filename):
            return self.process_ufo_file(sanitized_filename[:-4], app, user)

        source_ufo_path = os.path.join(self.source_folder_path(), 'master_ufo')
        source_otf_path = os.path.join(self.source_folder_path(), 'master_otf')
        found_folder = False

        # find all otf files and move them to their specific font folders
        # we get:
        # font/7/ufo/myFont.ufo
        # font/7/otf/myFont.otf
        otf_filenames = [os.path.basename(filename) for filename in glob.glob(source_otf_path + '/*.otf')]
        for otf_filename in otf_filenames:
            found_folder = True
            font_name = otf_filename[:-4]
            font = Font(font_name=font_name, author_id=user._id)
            self.fonts.append(font)
            session.commit()

            font.ensure_folder_exists()

            ufo_filename = font_name + '.ufo'

            shutil.move(os.path.join(source_ufo_path, ufo_filename), os.path.join(font.ufo_folder_path(), ufo_filename))
            shutil.move(os.path.join(source_otf_path, otf_filename), font.otf_folder_path())

        if not found_folder:
            raise FileNotFoundError('No otf files were generated')

        shutil.rmtree(source_ufo_path)
        shutil.rmtree(source_otf_path)

    def process_ufo_file(self, source_ufo_path, app, user):
        session = app.data.driver.session

        source_otf_path = os.path.join(self.source_folder_path(), 'master_otf')
        otf_filenames = [os.path.basename(filename) for filename in glob.glob(source_otf_path + '/*.otf')]
        if len(otf_filenames) != 1:
            raise FileNotFoundError('No otf files were generated')

        otf_filename = otf_filenames[0]
        font_name = otf_filename[:-4]
        font_name = otf_filename[:-4]

        font = Font(font_name=font_name, author_id=user._id)
        self.fonts.append(font)
        session.commit()

        font.ensure_folder_exists()

        shutil.move(os.path.join(self.source_folder_path(), source_ufo_path), os.path.join(font.ufo_folder_path(), source_ufo_path))
        shutil.move(os.path.join(source_otf_path, otf_filename), os.path.join(font.otf_folder_path(), otf_filename))

