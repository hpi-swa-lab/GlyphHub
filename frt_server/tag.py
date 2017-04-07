from frt_server.common import CommonColumns, Base
from sqlalchemy import Table, Column, Integer, ForeignKey, String
from sqlalchemy.orm import relationship

class Tag(CommonColumns):
    __tablename__ = 'tag'
    text = Column(String(200))
    type = Column(String(100))

tag_font_association_table = Table('tag_font_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tag._id')),
    Column('font_id', Integer, ForeignKey('font._id')))

tag_family_association_table = Table('tag_family_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tag._id')),
    Column('family_id', Integer, ForeignKey('family._id')))

tag_thread_association_table = Table('tag_thread_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tag._id')),
    Column('thread_id', Integer, ForeignKey('thread._id')))

tag_sample_text_association_table = Table('tag_sample_text_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tag._id')),
    Column('sample_text_id', Integer, ForeignKey('sample_text._id')))
