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

    def folder_path(self):
        """Path to the folder containing all the font sources"""
        return os.path.join(frt_server.config.FONT_UPLOAD_FOLDER, str(self._id))

    def ufo_folder_path(self):
        return os.path.join(self.folder_path(), 'ufo')

    def otf_folder_path(self):
        return os.path.join(self.folder_path(), 'otf')

    def ensure_folder_exists(self):
        """Ensure that the needed folders exist"""
        for path in (
                self.folder_path(),
                self.ufo_folder_path(),
                self.otf_folder_path()):
            if not os.path.exists(path):
                os.makedirs(path)

    def convert(self, unicode_points):
        otf_path = os.path.join(self.sourceFolderPath(), 'otf')
        for root, dirs, files in os.walk(otf_path):
            for name in files:
                if name.endswith('.otf'):
                    return hb_convert.to_glyphnames(os.path.join(otf_path, name), unicode_points)
