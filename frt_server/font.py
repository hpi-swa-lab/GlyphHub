import subprocess
import os
import glob
import shutil

from sqlalchemy import Column, Integer, ForeignKey, String, Text
from sqlalchemy.orm import relationship

from frt_server.tag import tag_font_association_table
from frt_server.common import CommonColumns
import frt_server.config
import hb_convert
import plistlib

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

    def ufo_file_path(self):
        return glob.glob(self.ufo_folder_path() + '/*.ufo')[0]

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

    def clean_folders(self):
        """Delete all our associated folders"""
        if os.path.exists(self.folder_path()):
            shutil.rmtree(self.folder_path())

    def convert(self, unicode_points):
        otf_path = self.otf_folder_path()
        otf_files = glob.glob(otf_path + '/*.otf')
        if len(otf_files) < 1:
            raise FileNotFoundError('Font does not contain a .otf')
        return hb_convert.to_glyphnames(otf_files[0], unicode_points)

    def get_glif_data(self, requested_glifs):
        # TODO: security! make sure we can't do directory traversal stuff.
        # using names + contents.plist still is dangerous because users can set arbitrary glif-locations there
        glif_dict = {}
        contents_plist = self.get_plist_contents(os.path.join('glyphs', 'contents'))

        for glif_name in requested_glifs:
            if glif_name in contents_plist:
                glif_filename = contents_plist[glif_name]
                with open(os.path.join(self.ufo_file_path(), 'glyphs', glif_filename)) as glif_file:
                    glif_dict[glif_name] = glif_file.read()
            else:
                glif_dict[glif_name] = None

        return glif_dict

    def get_plist_contents(self, plist_name, requested_contents = None):
        with open(os.path.join(self.ufo_file_path(), plist_name + '.plist'), 'rb') as plist_file:
            plist = plistlib.load(plist_file)
        if requested_contents == None:
            return plist
        else:
            raise Error("Warning: We do not support getting specific plist elements (yet).")

    def get_ufo_data(self, request_json):
        if 'fontinfo' in request_json:
            request_json['fontinfo'] = self.get_plist_contents('fontinfo', request_json['fontinfo'])
        if 'glyphs' in request_json:
            request_json['glyphs'] = self.get_plist_contents(os.path.join('glyphs', 'contents'), request_json['glyphs'])
        if 'glifs' in request_json:
            request_json['glifs'] = self.get_glif_data(request_json['glifs'])

        return request_json

