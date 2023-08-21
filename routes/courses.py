from fastapi import APIRouter,Depends
from sqlalchemy.orm import Session
from db import get_db
from functions.courses import *
from routes.auth import get_current_active_user
from schemas.courses import CoursesBase,CoursesUpdate,CoursesCreate
from schemas.users import UserCurrent
from pydantic.datetime_parse import date
# from datetime import date
import datetime


courses_router = APIRouter()


@courses_router.post("/add")
def add_courses(form:CoursesCreate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    if create_course(form, current_user, db):
        raise HTTPException(status_code=200, detail="Amaliyot muvaffaqiyatli amalga oshirildi")



@courses_router.get('/',  status_code = 200)
def get_payments(search:str=None,status:bool=True,id:int=0,start_date:date=datetime.datetime.now().date().min,end_date:date=datetime.datetime.now().date(),page:int=1,limit:int=2, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
    if id :
        return one_course(id, db)
    else :
        return all_users(search=search,status=status,start_date=start_date,end_date=end_date,page=page,limit=limit,db=db)




# @user_router.get('/user',  status_code = 200)
# def get_user_current(db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
#     if current_user:
#         return user_current(current_user, db)


@courses_router.put("/update")
def room_update(form:CoursesUpdate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return update_course(form=form,user=current_user,db=db)


@courses_router.delete("/delete")
def room_delete(id:int,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return course_delete(id=id,user=current_user,db=db)