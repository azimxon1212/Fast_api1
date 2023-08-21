from db import Base
from sqlalchemy.orm import relationship
from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Payment(Base):
    __tablename__ = 'Payment'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    name = Column(String(30),nullable=False)
    fan_id = Column(Integer,nullable=False)
    month = Column(String(50), nullable=False)
    price = Column(Integer,nullable=False)
    type = Column(String(30),nullable=False)
    student_id = Column(Integer, ForeignKey("Students.id"), nullable=False)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    status = Column(Boolean, nullable=False, default=True)

    tolov = relationship('Students', back_populates='student')



