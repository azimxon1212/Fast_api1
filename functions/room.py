from passlib.context import CryptContext
from sqlalchemy.orm import joinedload

import datetime
pwd_context = CryptContext(schemes=['bcrypt'])

from fastapi import HTTPException
from models.room import Room

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page,start_date, end_date, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Room.name.like(search_formatted) | Room.number.like(
            search_formatted)
    else:
        search_filter = Room.id > 0
    if status in [True, False]:
        status_filter = Room.status == status
    else:
        status_filter = Room.id > 0

    try:
        if not start_date:
            start_date = datetime.date.min
        if not end_date:
            end_date = datetime.date.today()
        end_date = datetime.datetime.strptime(str(end_date), "%Y-%m-%d").date() + datetime.timedelta(days=1)
    except Exception as error:
        raise HTTPException(status_code=400, detail="Faqat yyy-mmm-dd formatida yozing")

    dones = db.query(Room).filter(Room.date > start_date).filter(
        Room.date <= end_date).filter(search_filter, status_filter).order_by(Room.id.desc())

    if page and limit:
        return pageination(dones, page, limit)
    else:
        return dones.all()


def one_room(id, db):
    return db.query(Room).filter(Room.id == id).first()


def create_room(form, user, db):
    user_verification = db.query(Room).filter(Room.name == form.name).first()
    if user_verification:
        raise HTTPException(status_code=400, detail="Bunday xona mavjud")

    new_user_db = Room(
        name=form.name,
        number=form.number,
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_room(form, user, db):
    if one_room(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    user_verification = db.query(Room).filter(Room.id == form.id).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday xona mavjud")

    db.query(Room).filter(Room.id == form.id).update({
        Room.id: form.id,
        Room.name: form.name,
        Room.number:form.number,
        Room.status: form.status,

    })
    db.commit()

    return one_room(form.id, db)


def room_delete(id, db):
    if one_room(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(Room).filter(Room.id == id).update({
        Room.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







