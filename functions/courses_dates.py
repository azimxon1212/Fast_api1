from passlib.context import CryptContext
from sqlalchemy.orm import joinedload

import datetime
pwd_context = CryptContext(schemes=['bcrypt'])

from fastapi import HTTPException
from models.courses_dates import Courses_dates

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page,start_date, end_date, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Courses_dates.fan_id.like(search_formatted) | Courses_dates.teacher_id.like(search_formatted)
    else:
        search_filter = Courses_dates.id > 0
    if status in [True, False]:
        status_filter = Courses_dates.status == status
    else:
        status_filter = Courses_dates.id > 0

    try:
        if not start_date:
            start_date = datetime.date.min
        if not end_date:
            end_date = datetime.date.today()
        end_date = datetime.datetime.strptime(str(end_date), "%Y-%m-%d").date() + datetime.timedelta(days=1)
    except Exception as error:
        raise HTTPException(status_code=400, detail="Faqat yyy-mmm-dd formatida yozing")

    dones = db.query(Courses_dates).filter(Courses_dates.date > start_date).filter(
        Courses_dates.date <= end_date).filter(search_filter, status_filter).order_by(Courses_dates.id.desc())



    # users=db.query(Users).options(joinedload(Users.kpi), joinedload(Users.order.and_(Orders.status==True))).filter(search_filter, status_filter, roll_filter).order_by(Users.name.asc())
    # users = db.query(Courses_dates).options.filter(search_filter,
    #                                        status_filter,
    #                                        ).order_by(Courses_dates.id.desc())
    if page and limit:
        return pageination(dones, page, limit)
    else:
        return dones.all()


def one_course_date(id, db):
    return db.query(Courses_dates).filter(Courses_dates.id == id).first()





def create_course_date(form, user, db):
    # user_verification = db.query(Courses_dates).filter(Courses_dates.teacher_id == form.teacher_id).first()
    # if user_verification:
    #     raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")

    new_user_db = Courses_dates(
        fan_id=form.fan_id,
        kurs_muddati=form.kurs_muddati,
        room_id=form.room_id,
        davomat=form.davomat,
        begin=form.begin,
        finish=form.finish,
        teacher_id=form.teacher_id,
        student_id=form.student_id,
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_course_date(form, user, db):
    if one_course_date(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    user_verification = db.query(Courses_dates).filter(Courses_dates.teacher_id == form.teacher_id).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday ma'lumot mavjud")

    db.query(Courses_dates).filter(Courses_dates.id == form.id).update({
        Courses_dates.id: form.id,
        Courses_dates.fan_id: form.fan_id,
        Courses_dates.kurs_muddati: form.kurs_muddati,
        Courses_dates.room_id:form.room_id,
        Courses_dates.teacher_id:form.teacher_id,
        Courses_dates.davomat:form.davomat,
        Courses_dates.student_id:form.student_id,
        Courses_dates.begin: form.begin,
        Courses_dates.finish: form.finish,
        Courses_dates.status: form.status,

    })
    db.commit()

    return one_course_date(form.id, db)



def course_date_delete(id,user, db):
    if one_course_date(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(Courses_dates).filter(Courses_dates.id == id).update({
        Courses_dates.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







