from fastapi import APIRouter,Depends
from sqlalchemy.orm import Session
from db import get_db
from functions.students import *
from routes.auth import get_current_active_user
from schemas.students import StudentBase,StudentCreate,StudentUpdate
from schemas.users import UserCurrent
# from pydantic.datetime_parse import date
from datetime import date

import datetime


student_router = APIRouter()


@student_router.post("/add")
def add_student(form:StudentCreate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return create_student(form=form,user=current_user, db=db)



@student_router.get('/',  status_code = 200)
def get_students(search:str=None,status:bool=True,id:int=0,start_date:date=datetime.datetime.now().date().min,end_date:date=datetime.datetime.now().date(),page:int=1,limit:int=2, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
    if id :
        return one_student(id, db)
    else :
        return all_users(search=search,status=status,start_date=start_date,end_date=end_date,page=page,limit=limit,db=db)




# @user_router.get('/user',  status_code = 200)
# def get_user_current(db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
#     if current_user:
#         return user_current(current_user, db)


@student_router.put("/update")
def type_update(form:StudentUpdate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return update_student(form=form,user=current_user,db=db)


@student_router.delete("/delete")
def type_delete(id:int,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return student_delete(id=id,user=current_user,db=db)