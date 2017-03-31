from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, DateTime, Integer, func

Base = declarative_base()

class CommonColumns(Base):
    __abstract__ = True
    _created = Column(DateTime, default=func.now())
    _updated = Column(DateTime, default=func.now(), onupdate=func.now())
    _id = Column(Integer, primary_key=True, autoincrement=True)
