from pydantic import BaseModel


class StudentBase(BaseModel):
    name: str
    surname: str
    number: str
    age:int
    address:str
    sciences:str
    status: bool


class StudentCreate(StudentBase):
    password: str



class StudentUpdate(StudentBase):
    id: int
    password: str
