from pydantic import BaseModel
from typing import Optional, List


class SciencesBase(BaseModel):
    name: str
    fan_id:int

    status:bool


class SciencesCreate(SciencesBase):
    pass



class ScienceUpdate(SciencesBase):
    id:int
    user_id: int
