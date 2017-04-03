import subprocess
import os

from sqlalchemy import Column, Integer, ForeignKey, String, Text
from sqlalchemy.orm import relationship

from frt_server.tag import tag_font_association_table
from frt_server.common import CommonColumns
import frt_server.config
import hb_convert

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

    def sourceFolderPath(self):
        """Path to the folder containing all the font sources"""
        return os.path.join(frt_server.config.FONT_UPLOAD_FOLDER, str(self._id))

    def ensureSourceFolderExists(self):
        """Ensure that the folder at sourceFolderPath exists"""
        folder = self.sourceFolderPath()
        if not os.path.exists(folder):
            os.makedirs(folder)

    def convert(self, unicodePoints):
        otf_path = os.path.join(self.sourceFolderPath(), 'otf')
        for root, dirs, files in os.walk(otf_path):
            for name in files:
                if name.endswith('.otf'):
                    return hb_convert.to_glyphnames(os.path.join(otf_path, name), unicodePoints)
