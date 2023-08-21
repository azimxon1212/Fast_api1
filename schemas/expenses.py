from pydantic import BaseModel
from typing import Optional, List


class ExpensesBase(BaseModel):
    money:int
    comment:str
    type:str
    teacher_id:int
    status:bool

class ExpensesCreate(ExpensesBase):
    pass



class ExpensesUpdate(ExpensesBase):
    id:int