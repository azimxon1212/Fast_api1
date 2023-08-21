from db import Base
from sqlalchemy.orm import relationship
from sqlalchemy import Column,String,Integer,Float,DateTime,func,Boolean,ForeignKey


class Sciences(Base):
    __tablename__ = 'Sciences'
    id = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    name = Column(String(30),nullable=False)
    fan_id = Column(Integer,nullable=False)
    user_id = Column(Integer, ForeignKey("Users.id"), nullable=False)
    date = Column(DateTime(timezone=True), default=func.now(), nullable=False)
    status = Column(Boolean, nullable=False, default=True)

    science = relationship('Users', back_populates='fan')


