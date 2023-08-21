from db import Base

from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Room(Base):
    __tablename__ = 'Room'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    name = Column(String(30),nullable=False)
    number = Column(Integer,nullable=False)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    status = Column(Boolean, nullable=False, default=True)



