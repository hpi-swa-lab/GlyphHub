from common import CommonColumns
from sqlalchemy import Column, Integer, ForeignKey, String, Text
from sqlalchemy.orm import relationship
from tag import tag_font_association_table
import subprocess

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

    def isUFOFile(self):
        return self.path.endswith('.ufo')

    def convertFontForUpload(self):
        if self.isGlyphsFile():
            subprocess.run(["fontmake", "-g", self.path, "-o", "otf"])
        if self.isUFOFile():
            subprocess.run(["fontmake", "-u", self.path, "-o", "otf"])
