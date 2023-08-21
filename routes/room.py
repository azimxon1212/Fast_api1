from fastapi import APIRouter,Depends
from sqlalchemy.orm import Session
from db import get_db
from functions.room import *
from routes.auth import get_current_active_user
from schemas.room import RoomBase,RoomUpdate,RoomCreate
from schemas.users import UserCurrent
from pydantic.datetime_parse import date
import datetime


room_router = APIRouter()


@room_router.post("/add")
def add_room(form:RoomCreate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    if create_room(form, current_user, db):
        raise HTTPException(status_code=200, detail="Amaliyot muvaffaqiyatli amalga oshirildi")




@room_router.get('/',  status_code = 200)
def get_rooms(search:str=None,status:bool=True,id:int=0,start_date:date=datetime.datetime.now().date().min,end_date:date=datetime.datetime.now().date(),page:int=1,limit:int=2, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
    if id :
        return one_room(id, db)
    else :
        return all_users(search=search,status=status,start_date=start_date,end_date=end_date,page=page,limit=limit,db=db)




# @user_router.get('/user',  status_code = 200)
# def get_user_current(db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
#     if current_user:
#         return user_current(current_user, db)


@room_router.put("/update")
def room_update(form:RoomUpdate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return update_room(form=form,user=current_user,db=db)


@room_router.delete("/delete")
def room_delete(id:int,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return room_delete(id=id,user=current_user,db=db)