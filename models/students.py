from db import Base
from sqlalchemy.orm import relationship
from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Students(Base):
    __tablename__ = 'Students'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    name = Column(String(30),nullable=False)
    surname = Column(String(30), nullable=False)
    number = Column(String(30),nullable=False)
    age = Column(Integer,nullable=False)
    address = Column(String(100),nullable=False)
    sciences = Column(String(100), nullable=False)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    password = Column(String(200), nullable=False)
    status = Column(Boolean, nullable=False, default=True)
    token = Column(String(400), default='', nullable=True)

    student = relationship('Payment', back_populates='tolov')
