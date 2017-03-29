from common import CommonColumns
from sqlalchemy import Column, Integer, ForeignKey, String, Text
from sqlalchemy.orm import relationship
from tag import tag_font_association_table

class Font(CommonColumns):
    __tablename__ = 'font'
    font_name = Column(String(300))
    family_id = Column(Integer, ForeignKey('family._id'))
    author_id = Column(Integer, ForeignKey('user._id'))
    family = relationship('Family', back_populates='fonts')
    tags = relationship('Tag', secondary=tag_font_association_table)
    glyphs = relationship('Glyph', back_populates='font')
    author = relationship('User', back_populates='fonts')

