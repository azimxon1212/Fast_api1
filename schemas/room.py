from pydantic import BaseModel
from typing import Optional, List


class RoomBase(BaseModel):
    name: str
    number:int
    status:bool


class RoomCreate(RoomBase):
    pass



class RoomUpdate(RoomBase):
    id:int
