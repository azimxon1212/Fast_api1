from passlib.context import CryptContext
from sqlalchemy.orm import joinedload
import datetime
pwd_context = CryptContext(schemes=['bcrypt'])

from fastapi import HTTPException
from models.sciences import Sciences

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page,start_date, end_date, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Sciences.name.like(search_formatted) | Sciences.number.like(search_formatted) | Sciences.fan_id.like(
            search_formatted)
    else:
        search_filter = Sciences.id > 0
    if status in [True, False]:
        status_filter = Sciences.status == status
    else:
        status_filter = Sciences.id > 0
    try:
        if not start_date:
            start_date = datetime.date.min
        if not end_date:
            end_date = datetime.date.today()
        end_date = datetime.datetime.strptime(str(end_date), "%Y-%m-%d").date() + datetime.timedelta(days=1)
    except Exception as error:
        raise HTTPException(status_code=400, detail="Faqat yyy-mmm-dd formatida yozing")


    dones = db.query(Sciences).filter(Sciences.date > start_date).filter(
        Sciences.date <= end_date).filter(search_filter, status_filter).order_by(Sciences.id.desc())
    if page and limit:
        return pageination(dones, page, limit)
    else:
        return dones.all()


def one_science(id, db):
    return db.query(Sciences).filter(Sciences.id == id).first()





def create_science(form, user, db):
    user_verification = db.query(Sciences).filter(Sciences.name == form.name).first()
    if user_verification:
        raise HTTPException(status_code=400, detail="Bunday name mavjud")


    new_user_db = Sciences(
        name=form.name,
        user_id=user.id,
        fan_id=form.fan_id,
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_science(form, user, db):
    if one_science(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    user_verification = db.query(Sciences).filter(Sciences.user_id == form.user_id).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday fan mavjud")

    db.query(Sciences).filter(Sciences.id == form.id).update({
        Sciences.id:form.id,
        Sciences.name: form.name,
        Sciences.user_id:form.user_id,
        Sciences.fan_id:form.fan_id,
        Sciences.status: form.status,

    })
    db.commit()

    return one_science(form.id, db)



def science_delete(id, db):
    if one_science(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(Sciences).filter(Sciences.id == id).update({
        Sciences.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







