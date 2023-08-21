from fastapi import APIRouter,Depends
from sqlalchemy.orm import Session
from db import get_db
from functions.courses_dates import *
from routes.auth import get_current_active_user
from schemas.users import UserCurrent
from schemas.courses_dates import Courses_dates_Create,Courses_dates_Update,Courses_dates_Base
from pydantic.datetime_parse import date
import datetime


courses_date_router = APIRouter()


@courses_date_router.post("/add")
def add_courses_date(form:Courses_dates_Create,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    if create_course_date(form, current_user, db):
        raise HTTPException(status_code=200, detail="Amaliyot muvaffaqiyatli amalga oshirildi")



@courses_date_router.get('/',  status_code = 200)
def get_courses_dates(search:str=None,status:bool=True,id:int=0,start_date:date=datetime.datetime.now().date().min,end_date:date=datetime.datetime.now().date(),page:int=1,limit:int=2, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
    if id :
        return one_course_date(id, db)
    else :
        return all_users(search=search,status=status,start_date=start_date,end_date=end_date,page=page,limit=limit,db=db)




# @user_router.get('/user',  status_code = 200)
# def get_user_current(db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
#     if current_user:
#         return user_current(current_user, db)


@courses_date_router.put("/update")
def courses_date_update(form:Courses_dates_Update,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return update_course_date(form=form,user=current_user,db=db)


@courses_date_router.delete("/delete")
def courses_date_delete(id:int,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return course_date_delete(id=id,user=current_user,db=db)