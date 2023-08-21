from passlib.context import CryptContext
from sqlalchemy.orm import joinedload

# from models.orders import Orders

pwd_context = CryptContext(schemes=['bcrypt'])

from fastapi import HTTPException
from models.teachers import Teachers

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Teachers.name.like(search_formatted) | Teachers.number.like(search_formatted) | Teachers.username.like(
            search_formatted) | Teachers.roll.like(search_formatted)
    else:
        search_filter = Teachers.id > 0
    if status in [True, False]:
        status_filter = Teachers.status == status
    else:
        status_filter = Teachers.id > 0

    # users = db.query(Teachers).options(joinedload(Teachers.fan)).options(joinedload(Teachers.number)).filter(search_filter,status_filter)
    users = db.query(Teachers).filter(search_filter, status_filter).order_by(Teachers.name.asc())

    if page and limit:
        return pageination(users, page, limit)
    else:
        return users.all()


def one_teacher(id, db):
    return db.query(Teachers).filter(Teachers.id == id).first()


def user_current(user, db):
    return db.query(Teachers).filter(Teachers.id == user.id).first()


def create_teacher(form, user, db):
    user_verification = db.query(Teachers).filter(Teachers.number == form.number).first()
    if user_verification:
        raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")
    number_verification = db.query(Teachers).filter(Teachers.number == form.number).first()
    if number_verification:
        raise HTTPException(status_code=400, detail="Bunday telefon raqami  mavjud")

    new_user_db = Teachers(
        name=form.name,
        surname=form.surname,
        number=form.number,
        password=get_password_hash(form.password),
        fan_id=form.fan_id,
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_teacher(form, user, db):
    if one_teacher(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli foydalanuvchi mavjud emas")
    user_verification = db.query(Teachers).filter(Teachers.surname == form.surname).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")

    db.query(Teachers).filter(Teachers.id == form.id).update({
        Teachers.id: form.id,
        Teachers.name: form.name,
        Teachers.surname: form.surname,
        Teachers.password: get_password_hash(form.password),
        Teachers.status: form.status,
        Teachers.number: form.number,

    })
    db.commit()

    return one_teacher(form.id, db)


def update_user_salary(id, salary, db):
    if one_teacher(id, db) is None:
        raise HTTPException(status_code=400, detail=f"Bunday {id} raqamli hodim mavjud emas")

    db.query(Teachers).filter(Teachers.id == id).update({
        Teachers.salary: salary,

    })
    db.commit()
    return one_teacher(id, db)


def teacher_delete(id, db):
    if one_teacher(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(Teachers).filter(Teachers.id == id).update({
        Teachers.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







