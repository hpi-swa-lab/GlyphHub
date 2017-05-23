from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, DateTime, Integer, func

import enum

Base = declarative_base()

DATE_FORMAT = '%Y-%m-%dT%H:%M:%S.%f%z'

class CommonColumns(Base):
    __abstract__ = True
    created_at = Column(DateTime, server_default=func.now())
    updated_at = Column(DateTime, server_default=func.now(), onupdate=func.now())
    _id = Column(Integer, primary_key=True, autoincrement=True)

class FamilyUploadStatus(enum.IntEnum):
    ready_for_upload = 1
    processing = 2

