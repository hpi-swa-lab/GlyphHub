from sqlalchemy import Table, Column, DateTime, ForeignKey, Integer, String, Text, Float, LargeBinary, Enum, func
from sqlalchemy.orm import column_property, relationship, validates
from eve_sqlalchemy.decorators import registerSchema

import enum
import os
import shutil

from frt_server.user import User
from frt_server.font import Font
from frt_server.tag import Tag, tag_sample_text_association_table, tag_thread_association_table
from frt_server.family import Family
from frt_server.common import CommonColumns, Base
import frt_server.config

class SampleText(CommonColumns):
    __tablename__ = 'sample_text'
    title = Column(String(120))
    text = Column(Text)
    author_id = Column(Integer, ForeignKey('user._id'))
    author = relationship(User)
    tags = relationship('Tag', secondary=tag_sample_text_association_table)

class ThreadGlyphAssociation(CommonColumns):
    __tablename__ = 'thread_glyph_association'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    thread_id = Column(Integer, ForeignKey('thread._id'))
    glyph_id = Column(Integer, ForeignKey('glyph._id'))
    thread = relationship('Thread', back_populates='thread_glyph_associations')
    glyph = relationship('Glyph', back_populates='thread_glyph_associations')

class ThreadSubscription(CommonColumns):
    __tablename__ = 'thread_subscription'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user._id'))
    thread_id = Column(Integer, ForeignKey('thread._id'))
    """maybe use this table for 'last seen' or something to find unread updates of a thread?"""

class Glyph(CommonColumns):
    __tablename__ = 'glyph'
    glyph_name = Column(String(300))
    version_hash = Column(String(40))
    font_id = Column(Integer, ForeignKey('font._id'))
    font = relationship('Font', back_populates='glyphs')
    thread_glyph_associations = relationship('ThreadGlyphAssociation', back_populates='glyph')

class Thread(CommonColumns):
    __tablename__ = 'thread'
    title = Column(Text)
    tags = relationship('Tag', secondary=tag_thread_association_table)
    thread_glyph_associations = relationship('ThreadGlyphAssociation', back_populates='thread')
    # FIXME we also would like to save the indices of the glyphs from their unicode
    codepoints = relationship('Codepoint', back_populates='thread')
    comments = relationship('Comment', back_populates='thread')

class Codepoint(CommonColumns):
    __tablename__ = 'codepoint'
    index = Column(Integer)
    unicode_value = Column(Integer)
    features = Column(Text)
    point_size = Column(Float)
    thread_id = Column('thread_id', Integer, ForeignKey('thread._id'))
    font_id = Column('font_id', Integer, ForeignKey('font._id'))
    thread = relationship('Thread', back_populates='codepoints')
    font = relationship('Font')

class Comment(CommonColumns):
    __tablename__ = 'comment'
    text = Column(Text)
    thread_id = Column('thread_id', Integer, ForeignKey('thread._id'))
    author_id = Column('author_id', Integer, ForeignKey('user._id'))
    thread = relationship('Thread', back_populates='comments')
    author = relationship('User')
    attachments = relationship('Attachment', back_populates='comment')

class AttachmentType(enum.IntEnum):
    picture = 1
    file = 2
    outline = 3
    outline_diff = 4

class Attachment(CommonColumns):
    __tablename__ = 'attachment'
    type = Column(Enum(AttachmentType))
    data1 = Column(Text)
    data2 = Column(Text)
    annotation = Column(LargeBinary)
    comment_id = Column('comment_id', Integer, ForeignKey('comment._id'))
    owner_id = Column('owner_id', Integer, ForeignKey('user._id'))
    comment = relationship('Comment', back_populates='attachments')
    owner = relationship('User', back_populates='attachments')

    def file_path(self):
        return os.path.join(self.folder_path(), self.data1) if self.has_file() else ''

    def folder_path(self):
        return os.path.join(frt_server.config.ATTACHMENT_UPLOAD_FOLDER, str(self._id))

    def ensure_folder_exists(self):
        if self.has_file() and not os.path.exists(self.folder_path()):
            os.makedirs(self.folder_path())

    def clean_folder(self):
        """Delete our associated folder"""
        if self.has_file() and os.path.exists(self.folder_path()):
            shutil.rmtree(self.folder_path())

    def has_file(self):
        return self.type in (AttachmentType.picture, AttachmentType.file)

registerSchema('user')(User)
registerSchema('tag')(Tag)
registerSchema('sample_text')(SampleText)
registerSchema('family')(Family)
registerSchema('font')(Font)
registerSchema('glyph')(Glyph)
registerSchema('thread')(Thread)
registerSchema('codepoint')(Codepoint)
registerSchema('comment')(Comment)
registerSchema('attachment')(Attachment)
registerSchema('thread_glyph_association')(ThreadGlyphAssociation)
