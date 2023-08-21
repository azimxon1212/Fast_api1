from db import Base

from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Courses(Base):
    __tablename__ = 'Courses'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    fan_id = Column(Integer, ForeignKey("Sciences.id"),nullable=False)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    kurs_muddati = Column(String(100),nullable=False)
    teacher_id = Column(Integer, ForeignKey("Teachers.id"), nullable=False)
    room = Column(String(30),nullable=False)
    status = Column(Boolean, nullable=False, default=True)


