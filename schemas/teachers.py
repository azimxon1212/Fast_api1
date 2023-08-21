from pydantic import BaseModel
from typing import Optional



class TeacherBase(BaseModel):
    name: str
    surname:str
    number:int
    status: bool
    password: str
    fan_id: int


class TeacherCreate(TeacherBase):
    pass




class TeacherUpdate(TeacherBase):
    id: int
