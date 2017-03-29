import subprocess
import os

from sqlalchemy import Column, Integer, ForeignKey, String, Text
from sqlalchemy.orm import relationship

from tag import tag_font_association_table
from common import CommonColumns
import config

class Font(CommonColumns):
    __tablename__ = 'font'
    font_name = Column(String(300))
    family_id = Column(Integer, ForeignKey('family._id'))
    author_id = Column(Integer, ForeignKey('user._id'))
    family = relationship('Family', back_populates='fonts')
    tags = relationship('Tag', secondary=tag_font_association_table)
    glyphs = relationship('Glyph', back_populates='font')
    author = relationship('User', back_populates='fonts')
    path = Column(String(300))

    def isGlyphsFile(self):
        return self.path.endswith('.glyphs')

    def sourceFolderPath(self):
        """Path to the folder containing all the font sources"""
        return os.path.join(config.FONT_UPLOAD_FOLDER, str(self._id))

    def sourcePath(self):
        """Path to the original uploaded font file"""
        return os.path.join(self.sourceFolderPath(), self.path)

    def ensureSourceFolderExists(self):
        """Ensure that the folder at sourceFolderPath exists"""
        folder = self.sourceFolderPath()
        if not os.path.exists(folder):
            os.makedirs(folder)

    def isUFOFile(self):
        return self.path.endswith('.ufo')

    def convertFontForUpload(self):
        if self.isGlyphsFile():
            subprocess.run(["fontmake", "-g", self.path, "-o", "otf"])
        if self.isUFOFile():
            subprocess.run(["fontmake", "-u", self.path, "-o", "otf"])
