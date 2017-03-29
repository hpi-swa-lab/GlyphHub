from sqlalchemy import Table, Column, DateTime, ForeignKey, Integer, String, Text, Float, LargeBinary, Enum, func
from sqlalchemy.orm import column_property, relationship, validates
from eve_sqlalchemy.decorators import registerSchema

import enum

from user import User
from font import Font
from tag import Tag, tag_sample_text_association_table, tag_thread_association_table
from common import CommonColumns, Base

class SampleText(CommonColumns):
    __tablename__ = 'sample_text'
    title = Column(String(120))
    text = Column(Text)
    author_id = Column(Integer, ForeignKey('user._id'))
    author = relationship(User)
    tags = relationship('Tag', secondary=tag_sample_text_association_table)

class Family(CommonColumns):
    __tablename__ = 'family'
    family_name = Column(String(300))
    fonts = relationship('Font', back_populates='family')

class Glyph(CommonColumns):
    __tablename__ = 'glyph'
    glyph_name = Column(String(300))
    version_hash = Column(String(40))
    font_id = Column(Integer, ForeignKey('font._id'))
    font = relationship('Font', back_populates='glyphs')

thread_glyph_association_table = Table('thread_glyph_association', Base.metadata,
    Column('thread_id', Integer, ForeignKey('thread._id')),
    Column('glyph_id', Integer, ForeignKey('glyph._id')))

class Thread(CommonColumns):
    __tablename__ = 'thread'
    title = Column(Text)
    tags = relationship('Tag', secondary=tag_thread_association_table)
    glyphs = relationship('Glyph', secondary=thread_glyph_association_table)
    # FIXME we also would like to save the indices of the glyphs from their unicode
    codepoints = relationship('Codepoint', back_populates='thread')
    comments = relationship('Comment', back_populates='thread')

class Codepoint(CommonColumns):
    __tablename__ = 'codepoint'
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
    attachment = relationship('Attachment', back_populates='comment')

class AttachmentType(enum.Enum):
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
    comment = relationship('Comment', back_populates='attachment')

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
