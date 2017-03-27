from sqlalchemy import Table, Column, DateTime, ForeignKey, Integer, String, Text, Float, LargeBinary, Enum, func
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import column_property, relationship
from eve_sqlalchemy.decorators import registerSchema
import enum

Base = declarative_base()

class CommonColumns(Base):
    __abstract__ = True
    _created = Column(DateTime, default=func.now())
    _updated = Column(DateTime, default=func.now(), onupdate=func.now())
    _id = Column(Integer, primary_key=True, autoincrement=True)

class User(CommonColumns):
    __tablename__ = 'user'
    name = Column(String(120))
    password = Column(String(120))
    fonts = relationship('Font', back_populates='author')

class Tag(CommonColumns):
    __tablename__ = 'tag'
    text = Column(String(200))
    type = Column(String(100))

tag_sample_text_association_table = Table('tag_sample_text_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tag._id')),
    Column('sample_text_id', Integer, ForeignKey('sample_text._id')))

class SampleText(CommonColumns):
    __tablename__ = 'sample_text'
    title = Column(String(120))
    text = Column(Text)
    author_id = Column(Integer, ForeignKey('user._id'))
    author = relationship(User, uselist=False)
    tags = relationship('Tag', secondary=tag_sample_text_association_table)

class Family(CommonColumns):
    __tablename__ = 'family'
    name = Column(String(300))
    fonts = relationship('Font', back_populates='family')

tag_font_association_table = Table('tag_font_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tag._id')),
    Column('font_id', Integer, ForeignKey('font._id')))

class Font(CommonColumns):
    __tablename__ = 'font'
    name = Column(String(300))
    family_id = Column(Integer, ForeignKey('family._id'))
    author_id = Column(Integer, ForeignKey('user._id'))
    family = relationship('Family', back_populates='fonts')
    tags = relationship('Tag', secondary=tag_font_association_table)
    glyphs = relationship('Glyph', back_populates='font')
    author = relationship('User', back_populates='fonts')

class Glyph(CommonColumns):
    __tablename__ = 'glyph'
    name = Column(String(300))
    version_hash = Column(String(40))
    font_id = Column(Integer, ForeignKey('font._id'))
    font = relationship('Font', back_populates='glyphs')

tag_thread_association_table = Table('tag_thread_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tag._id')),
    Column('thread_id', Integer, ForeignKey('thread._id')))

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
    value = Column(Integer)
    features = Column(Text)
    size = Column(Float)
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
