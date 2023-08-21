from pydantic import BaseModel
from typing import Optional, List


class CoursesBase(BaseModel):
    fan_id:int
    kurs_muddati:str
    teacher_id:int
    room:str
    status:bool

class CoursesCreate(CoursesBase):
    pass



class CoursesUpdate(CoursesBase):
    id:int