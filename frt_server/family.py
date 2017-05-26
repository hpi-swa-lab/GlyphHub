from sqlalchemy import Column, String, inspect, Integer, ForeignKey, Enum, Text, event
from sqlalchemy.orm import relationship
import werkzeug

from frt_server.common import CommonColumns, DATE_FORMAT, FamilyUploadStatus
from frt_server.font import Font
from frt_server.tag import tag_family_association_table
import frt_server.config
import frt_server.fontmake_converter

import os
import pygit2
import datetime
import threading

from werkzeug.utils import secure_filename

class Family(CommonColumns):
    __tablename__ = 'family'
    family_name = Column(String(300))
    preview_glyphs = Column(String(500), default='')
    upload_status = Column(Enum(FamilyUploadStatus))
    about = Column(Text)
    last_upload_error = Column(Text)
    author_id = Column(Integer, ForeignKey('user._id'))
    fonts = relationship('Font', back_populates='family')
    tags = relationship('Tag', secondary=tag_family_association_table)
    standard_sample_text = relationship('SampleText', back_populates='families')
    standard_sample_text_id = Column(Integer, ForeignKey('sample_text._id'))
    author = relationship('User', back_populates='families')

    def delete_family_if_empty(family):
        if not family.fonts:
            session = inspect(family).session
            session.delete(family)
            session.commit()

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

    def font_for_file_named(self, ufo_filename):
        """check if an ufo file with that name already exists and return the associated font if it does"""
        for font in self.fonts:
            if font.ufo_file_path().endswith(os.path.basename(ufo_filename)):
                return font

    def process_file(self, app, family_file, user, commit_message, asynchronous=True):
        """convert a glyphs or ufo file to (ufo and) otf, create all associated Font entities, move files to the right folders
        we get:
        family/3/sourceFile.glyphs
        family/3/fonts/7/ufo/myFont.ufo
        otf/7-a7fbe7282cd98efa32ab2728effdc.otf (font_id-commit_hash.otf)"""

        sanitized_filename = secure_filename(os.path.basename(family_file.filename))
        if not sanitized_filename:
            raise Exception("Exception: Filename is invalid.")

        self.ensure_source_folder_exists()
        family_file.save(os.path.join(self.source_folder_path(), sanitized_filename))

        #self.upload_status = FamilyUploadStatus.processing
        #self.last_upload_error = None
        #inspect(self).session.commit()
        with app.app_context():
            session = app.create_scoped_session()
            assert session
            thread = threading.Thread(target=frt_server.fontmake_converter.convert, args=(session, sanitized_filename, self, user, commit_message))
            thread.start()
            if not asynchronous:
                thread.join()

    def process_filename(self, app, family_filename, user, commit_message):
        """synchronously processes the file at the given path for this family"""
        with open(family_filename, 'rb') as family_file:
            self.process_file(
                    app,
                    werkzeug.datastructures.FileStorage(family_file, family_filename, 'file'),
                    user,
                    commit_message,
                    False)

    def create_commit(self, message, user):
        self.ensure_source_folder_exists()

        index = self.repo.index
        index.add_all()

        treeId = index.write_tree(self.repo)
        author = pygit2.Signature(user.username, user.email)

        parents = [] if self.repo.head_is_unborn else [self.repo.head.target]

        oid = self.repo.create_commit('HEAD', author, author, message, treeId, parents)
        return str(oid)

    def reset_working_copy(self):
        self.repo.reset(self.repo.head.target, pygit2.GIT_RESET_HARD)

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

# hook that runs after a family was loaded from the database
@event.listens_for(Family, 'load')
def after_font_load(family, _):
    family.version_messages = family.versions()

