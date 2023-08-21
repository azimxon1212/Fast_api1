from pydantic import BaseModel
from typing import Optional, List


class PaymentBase(BaseModel):
    name: str
    month:str
    fan_id:int
    price:int
    type:str
    student_id:int
    status:bool

class PaymentCreate(PaymentBase):
    pass



class PaymentUpdate(PaymentBase):
    id:int
