from db import Base

from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Courses_dates(Base):
    __tablename__ = 'Courses_dates'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    fan_id = Column(Integer, ForeignKey("Sciences.id"),nullable=False)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    room_id = Column(Integer, ForeignKey("Room.id"),nullable=False)
    kurs_muddati = Column(String(200),nullable=False)
    davomat = Column(String(100),nullable=False)
    begin = Column(String(100),nullable=False)
    finish = Column(String(100),nullable=False)
    teacher_id = Column(Integer, ForeignKey("Teachers.id"), nullable=False)
    student_id = Column(Integer, ForeignKey("Students.id"), nullable=False)
    status = Column(Boolean, nullable=False, default=True)


