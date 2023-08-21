from db import Base
from sqlalchemy.orm import relationship
from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Teachers(Base):
    __tablename__ = 'Teachers'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    name = Column(String(30),nullable=False)
    surname = Column(String(30), nullable=False)
    number = Column(String(30),nullable=False)
    password = Column(String(200), nullable=False)
    fan_id = Column(Integer,nullable=True)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    status = Column(Boolean, nullable=False, default=True)
    token = Column(String(400), default='', nullable=True)



