from sqlalchemy import Column, String
from sqlalchemy.orm import relationship

from frt_server.common import CommonColumns
from frt_server.font import Font
import frt_server.config

import os
import subprocess
import shutil

from werkzeug.utils import secure_filename

class Family(CommonColumns):
    __tablename__ = 'family'
    family_name = Column(String(300))
    fonts = relationship('Font', back_populates='family')

    def isGlyphsFile(self, filename):
        return filename.endswith('.glyphs')

    def isUFOFile(self, filename):
        return filename.endswith('.ufo')

    def sourceFolderPath(self):
        """Path to the folder containing all the family sources"""
        return os.path.join(frt_server.config.FAMILY_UPLOAD_FOLDER, str(self._id))

    def ensureSourceFolderExists(self):
        """Ensure that the folder at sourceFolderPath exists"""
        folder = self.sourceFolderPath()
        if not os.path.exists(folder):
            os.makedirs(folder)

    def convertFontAfterUpload(self, filename):
        """invoke fontmake in our source folder. no cleanup performed after"""
        typeParam = None
        if self.isGlyphsFile(filename):
            typeParam = "-g"
        if self.isUFOFile(filename):
            typeParam = "-u"

        subprocess.run(['fontmake', typeParam, filename, '--no-production-names', '-o', 'otf', '--verbose', 'CRITICAL'],
                cwd=self.sourceFolderPath())

    def processFile(self, familyFile, app, user):
        """convert a glyphs file to ufo and otf, create all associated Font entities"""
        sanitized_filename = secure_filename(familyFile.filename)

        self.ensureSourceFolderExists()
        familyFile.save(os.path.join(self.sourceFolderPath(), sanitized_filename))
        self.convertFontAfterUpload(sanitized_filename)

        session = app.data.driver.session
        session.commit()

        sourceUfoPath = os.path.join(self.sourceFolderPath(), 'master_ufo')
        sourceOtfPath = os.path.join(self.sourceFolderPath(), 'master_otf')

        for _, directories, _ in os.walk(sourceUfoPath):
            for fileName in directories:
                if not fileName.endswith('.ufo'):
                    continue

                fontName = fileName[:-4]
                font = Font(font_name=fontName, family_id=self._id, author_id=user._id)
                self.fonts.append(font)
                session.commit()

                otfFilename = fontName + '.otf'
                targetUfoPath = os.path.join(font.sourceFolderPath(), 'ufo')
                targetOtfPath = os.path.join(font.sourceFolderPath(), 'otf')

                shutil.move(os.path.join(sourceUfoPath, fileName), targetUfoPath)
                os.makedirs(targetOtfPath)
                shutil.move(os.path.join(sourceOtfPath, otfFilename), os.path.join(targetOtfPath, otfFilename))

        shutil.rmtree(sourceUfoPath)
        shutil.rmtree(sourceOtfPath)
