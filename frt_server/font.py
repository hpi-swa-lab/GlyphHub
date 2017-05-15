import subprocess
import os
import glob
import shutil

from sqlalchemy import Column, Integer, ForeignKey, String, Text, event
from sqlalchemy.orm import relationship

from frt_server.tag import tag_font_association_table
from frt_server.common import CommonColumns
import frt_server.config
import frt_hb_convert
import plistlib

import pygit2

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
        ufo_filenames = glob.glob(self.ufo_folder_path() + '/*.ufo')
        if not ufo_filenames:
            raise FileNotFoundError('no ufo file found for font ' + self.font_name)
        return ufo_filenames[0]

    def ufo_file_name(self):
        return os.path.basename(self.ufo_file_path())

    def otf_folder_path(self):
        return os.path.join(self.folder_path(), 'otf')

    def otf_file_path(self):
        otf_filenames = glob.glob(self.otf_folder_path() + '/*.otf')
        if not otf_filenames:
            raise FileNotFoundError('no otf file found for font ' + self.font_name)
        return otf_filenames[0]

    def get_otf_contents(self):
        with open(self.otf_file_path(), 'rb') as otf_file:
            contents = otf_file.read(50*1024*1024)
        return contents

    def ensure_folder_exists(self):
        """Ensure that the needed folders exists"""
        if not os.path.exists(self.folder_path()):
            os.makedirs(self.folder_path())
            self.repo = pygit2.init_repository(self.folder_path())
        else:
            self.repo = pygit2.Repository(self.folder_path())

        for path in (self.ufo_folder_path(), self.otf_folder_path()):
            if not os.path.exists(path):
                os.makedirs(path)

    def clean_folders(self):
        """Delete all our associated folders"""
        if os.path.exists(self.folder_path()):
            shutil.rmtree(self.folder_path())

    def create_commit(self, message, user):
        self.ensure_folder_exists()

        index = self.repo.index
        index.add_all()

        treeId = index.write_tree(self.repo)
        # FIXME insert real mail here once available
        author = pygit2.Signature(user.username, 'test@example.com')

        parents = [] if self.repo.head_is_unborn else [self.repo.head.target]

        self.repo.create_commit('HEAD', author, author, message, treeId, parents)

    def _repo(self):
        """return the internal pygit2 repo object"""
        self.ensure_folder_exists()
        return self.repo

    def versioned_file_at_path(self, path, version_hash=None):
        """return the contents of the file at path at the version of version_hash.
        if version_hash is None, the newest will be returned"""
        if not version_hash:
            with open(os.path.join(self.folder_path(), path)) as file:
                return file.read()

        commit = self.repo.get(pygit2.Oid(hex=version_hash))
        tree = commit.tree
        try:
            for entry in path.split('/'):
                tree = self.repo.get(tree[entry].id)
        except KeyError:
            raise FileNotFoundError()

        return tree.data

    def versioned_file_at_path_or_none(self, path, version_hash=None):
        try:
            return self.versioned_file_at_path(path, version_hash)
        except FileNotFoundError:
            return None

    def versions(self):
        self.ensure_folder_exists()
        return list(map(lambda entry: {'version_hash': str(entry.id), 'message': entry.message},
            self.repo.walk(self.repo.head.target)))

    def convert(self, unicode_points):
        otf_path = self.otf_folder_path()
        otf_files = glob.glob(otf_path + '/*.otf')
        if len(otf_files) < 1:
            raise FileNotFoundError('Font does not contain a .otf')
        return frt_hb_convert.to_glyphnames(otf_files[0], unicode_points)

    def get_glif_data(self, requested_glifs, version_hash=None):
        """return the .glif file contents for a set of glifs. specify version_hash to
        get the contents at a specific version. if not specified, the newest will be returned"""
        # TODO: security! make sure we can't do directory traversal stuff.
        # using names + contents.plist still is dangerous because users can set arbitrary
        # glif-locations there
        glif_dict = {}
        contents_plist = self.get_plist_contents(os.path.join('glyphs', 'contents'), version_hash)

        # if requested_glifs is None or '', we want to return all glifs
        if not requested_glifs:
            requested_glifs = contents_plist.keys()

        for glif_name in requested_glifs:
            if glif_name in contents_plist:
                glif_filename = contents_plist[glif_name]
                glif_dict[glif_name] = self.versioned_file_at_path('ufo/' + self.ufo_file_name() + '/glyphs/' + glif_filename, version_hash)
            else:
                glif_dict[glif_name] = None

        return glif_dict

    def get_plist_contents(self, plist_name, requested_contents=None, version_hash=None):
        """given the name of a plist file, return the entire file (requested_contents is
        currently not supported and needs to be None). if version_hash is not None, fetch
        the file at the given version"""
        try:
            plist = plistlib.loads(str.encode(self.versioned_file_at_path('ufo/' + self.ufo_file_name() + '/' + plist_name + '.plist')))
            if requested_contents == None:
                return plist
            else:
                raise Error("Warning: We do not support getting specific plist elements (yet).")
        except OSError:
            return None

    def get_ufo_data(self, request_json, version_hash=None):
        """fill in the fields of the request_json dictionary. if version_hash is not None, fill in the
        files as they were at the given version"""

        if 'fontinfo' in request_json:
            request_json['fontinfo'] = self.get_plist_contents('fontinfo', request_json['fontinfo'], version_hash)
        if 'kerning' in request_json:
            request_json['kerning'] = self.get_plist_contents('kerning', request_json['kerning'], version_hash)
        if 'groups' in request_json:
            request_json['groups'] = self.get_plist_contents('groups', request_json['groups'], version_hash)
        if 'glyphs' in request_json:
            request_json['glyphs'] = self.get_plist_contents(os.path.join('glyphs', 'contents'), request_json['glyphs'], version_hash)
        if 'glifs' in request_json:
            request_json['glifs'] = self.get_glif_data(request_json['glifs'], version_hash)
        if 'features' in request_json:
            request_json['features'] = self.versioned_file_at_path_or_none('ufo/' + self.ufo_file_name() + '/features.fea')
        return request_json

@event.listens_for(Font, 'load')
def after_font_load(target, context):
    target.version_messages = target.versions()

