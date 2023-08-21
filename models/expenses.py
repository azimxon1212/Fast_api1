from db import Base

from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Expenses(Base):
    __tablename__ = 'Expenses'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    money = Column(Integer,nullable=False)
    comment = Column(String(200),nullable=False)
    type = Column(String(20),nullable=False)
    teacher_id = Column(Integer, ForeignKey("Teachers.id"), nullable=False)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    status = Column(Boolean, nullable=False, default=True)



