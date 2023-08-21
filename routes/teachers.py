
from fastapi import APIRouter, Depends, HTTPException
from db import Base, engine,get_db

from sqlalchemy.orm import Session

from routes.auth import get_current_active_user

Base.metadata.create_all(bind=engine)

from functions.teachers import one_teacher,all_users,update_teacher,create_teacher,teacher_delete,user_current
from schemas.teachers import TeacherBase,TeacherCreate,TeacherUpdate
from schemas.users import UserCurrent

router_teacher = APIRouter()



@router_teacher.post('/add', )
def add_user(form: TeacherCreate, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : #
    if create_teacher(form, current_user, db) :
        raise HTTPException(status_code = 200, detail = "Amaliyot muvaffaqiyatli amalga oshirildi")


@router_teacher.get('/',  status_code = 200)
def get_users(search: str = None, status: bool = True, id: int = 0,roll : str = None, page: int = 1, limit: int = 25, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
    if id :
        return one_teacher(id, db)
    else :
        return all_users(search, status, page, limit,db)

@router_teacher.get('/user',  status_code = 200)
def get_user_current(db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
    if current_user:
        return user_current(current_user, db)


@router_teacher.put("/update")
def user_update(form: TeacherUpdate, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)) :
    if update_teacher(form,current_user, db) :
        raise HTTPException(status_code = 200, detail = "Amaliyot muvaffaqiyatli amalga oshirildi")




@router_teacher.delete('/{id}',  status_code = 200)
def delete_user(id: int = 0,db: Session = Depends(get_db), current_user: UserCurrent = Depends(get_current_active_user)) : # current_user: User = Depends(get_current_active_user)
    if id :
        return delete_user(id, db)