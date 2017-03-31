from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
from common import CommonColumns
from font import Font

import config
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
        return os.path.join(config.FAMILY_UPLOAD_FOLDER, str(self._id))

    def ensureSourceFolderExists(self):
        """Ensure that the folder at sourceFolderPath exists"""
        folder = self.sourceFolderPath()
        if not os.path.exists(folder):
            os.makedirs(folder)

    def convertFontAfterUpload(self, filename):
        typeParam = None
        if self.isGlyphsFile(filename):
            typeParam = "-g"
        if self.isUFOFile(filename):
            typeParam = "-u"

        subprocess.run(["fontmake", typeParam, filename, "--no-production-names", "-o", "otf"],
                cwd=self.sourceFolderPath())
    
    def processFile(self, familyFile, app, user):
        sanitized_filename = secure_filename(familyFile.filename)
        
        self.ensureSourceFolderExists()
        familyFile.save(os.path.join(self.sourceFolderPath(), sanitized_filename))
        self.convertFontAfterUpload(sanitized_filename)
        
        session = app.data.driver.session
        session.commit()

        ufo_path = os.path.join(self.sourceFolderPath(), 'master_ufo')
        otf_path = os.path.join(self.sourceFolderPath(), 'master_otf')
        
        for root, dirs, files in os.walk(ufo_path):
            for name in dirs:
                if name.endswith('.ufo'):
                    font = Font(font_name=name[:-4], family_id=self._id, author_id=user._id)
                    self.fonts.append(font)
                    session.commit()
                    shutil.move(os.path.join(ufo_path, name), os.path.join(font.sourceFolderPath(), 'ufo'))
                    print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx')
                    print(font.convert("abc"))
                    """TODO: uncomment when OTF files are generated"""
                    #shutil.move(os.path.join(otf_path, name[:-4], '.otf'), os.path.join(font.sourceFolderPath(), 'otf'))
                    
        shutil.rmtree(ufo_path)
        shutil.rmtree(otf_path)
