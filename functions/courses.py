from passlib.context import CryptContext
from sqlalchemy.orm import joinedload

import datetime
pwd_context = CryptContext(schemes=['bcrypt'])

from fastapi import HTTPException
from models.courses import Courses

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page,start_date, end_date, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Courses.fan_id.like(search_formatted) | Courses.kurs_muddati.like(search_formatted)
    else:
        search_filter = Courses.id > 0
    if status in [True, False]:
        status_filter = Courses.status == status
    else:
        status_filter = Courses.id > 0

    try:
        if not start_date:
            start_date = datetime.date.min
        if not end_date:
            end_date = datetime.date.today()
        end_date = datetime.datetime.strptime(str(end_date), "%Y-%m-%d").date() + datetime.timedelta(days=1)
    except Exception as error:
        raise HTTPException(status_code=400, detail="Faqat yyy-mmm-dd formatida yozing")

    dones = db.query(Courses).filter(Courses.date > start_date).filter(
        Courses.date <= end_date).filter(search_filter, status_filter).order_by(Courses.id.desc())



    if page and limit:
        return pageination(dones, page, limit)
    else:
        return dones.all()


def one_course(id, db):
    return db.query(Courses).filter(Courses.id == id).first()





def create_course(form, user, db):
    user_verification = db.query(Courses).filter(Courses.fan_id == form.fan_id).first()
    if user_verification:
        raise HTTPException(status_code=400, detail="Bunday kurs mavjud")

    new_user_db = Courses(
        fan_id=form.fan_id,
        kurs_muddati=form.kurs_muddati,
        room=form.room,
        teacher_id=form.teacher_id,
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_course(form, user, db):
    if one_course(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    user_verification = db.query(Courses).filter(Courses.teacher_id == form.teacher_id).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday ma'lumot mavjud")

    db.query(Courses).filter(Courses.id == form.id).update({
        Courses.id: form.id,
        Courses.fan_id: form.fan_id,
        Courses.kurs_muddati: form.kurs_muddati,
        Courses.room:form.room,
        Courses.teacher_id:form.teacher_id,
        Courses.status: form.status,

    })
    db.commit()

    return one_course(form.id, db)



def course_delete(id,user, db):
    if one_course(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(one_course).filter(Courses.id == id).update({
        Courses.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







