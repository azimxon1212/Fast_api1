from pydantic import BaseModel
from typing import Optional, List
import datetime

class Courses_dates_Base(BaseModel):
    fan_id:int
    room_id:int
    davomat:str
    kurs_muddati:str
    begin:str
    finish:str
    teacher_id:int
    student_id:int
    status:bool

class Courses_dates_Create(Courses_dates_Base):
    pass



class Courses_dates_Update(Courses_dates_Base):
    id:int
