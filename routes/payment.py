from fastapi import APIRouter,Depends
from sqlalchemy.orm import Session
from db import get_db
from functions.payment import *
from routes.auth import get_current_active_user
from schemas.payment import PaymentBase,PaymentUpdate,PaymentCreate
from schemas.users import UserCurrent
from pydantic.datetime_parse import date
import datetime


payment_router = APIRouter()


@payment_router.post("/add")
def add_payment(form:PaymentCreate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return create_payment(form=form,user=current_user, db=db)



@payment_router.get('/',  status_code = 200)
def get_payments(search:str=None,status:bool=True,id:int=0,start_date:date=datetime.datetime.now().date().min,end_date:date=datetime.datetime.now().date(),page:int=1,limit:int=2, db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
    if id :
        return one_payment(id, db)
    else :
        return all_users(search=search,status=status,start_date=start_date,end_date=end_date,page=page,limit=limit,db=db)




# @user_router.get('/user',  status_code = 200)
# def get_user_current(db: Session = Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user) ) : # current_user: User = Depends(get_current_active_user)
#     if current_user:
#         return user_current(current_user, db)


@payment_router.put("/update")
def payment_update(form:PaymentUpdate,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return update_payment(form=form,user=current_user,db=db)


@payment_router.delete("/delete")
def payment_delete(id:int,db:Session=Depends(get_db),current_user: UserCurrent = Depends(get_current_active_user)):
    return payment_delete(id=id,user=current_user,db=db)