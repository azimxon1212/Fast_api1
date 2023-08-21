from passlib.context import CryptContext
from sqlalchemy.orm import joinedload

# from models.orders import Orders

pwd_context = CryptContext(schemes=['bcrypt'])
import datetime
from fastapi import HTTPException
from models.students import Students

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page, start_date, end_date, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Students.name.like(search_formatted) | Students.number.like(search_formatted) | Students.surname.like(
            search_formatted)
    else:
        search_filter = Students.id > 0
    if status in [True, False]:
        status_filter = Students.status == status
    else:
        status_filter = Students.id > 0


    try:
        if not start_date:
            start_date = datetime.date.min
        if not end_date:
            end_date = datetime.date.today()
        end_date = datetime.datetime.strptime(str(end_date), "%Y-%m-%d").date() + datetime.timedelta(days=1)
    except Exception as error:
        raise HTTPException(status_code=400, detail="Faqat yyy-mmm-dd formatida yozing")
    dones = db.query(Students).filter(Students.date > start_date).filter(
        Students.date <= end_date).filter(search_filter, status_filter).order_by(Students.id.desc())
    if page and limit:
        return pageination(dones, page, limit)
    else:
        return dones.all()


def one_student(id, db):
    return db.query(Students).filter(Students.id == id).first()



def create_student(form, user, db):
    user_verification = db.query(Students).filter(Students.surname == form.surname).first()
    if user_verification:
        raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")
    number_verification = db.query(Students).filter(Students.number == form.number).first()
    if number_verification:
        raise HTTPException(status_code=400, detail="Bunday telefon raqami  mavjud")

    new_user_db = Students(
        name=form.name,
        surname=form.surname,
        number=form.number,
        age=form.age,
        address=form.address,
        sciences=form.sciences,
        password=get_password_hash(form.password),
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_student(form, user, db):
    if one_student(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli foydalanuvchi mavjud emas")
    user_verification = db.query(Students).filter(Students.surname == form.surname).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")

    db.query(Students).filter(Students.id == form.id).update({
        Students.id: form.id,
        Students.name: form.name,
        Students.surname: form.surname,
        Students.age:form.age,
        Students.address:form.address,
        Students.password: get_password_hash(form.password),
        Students.status: form.status,
        Students.number: form.number,

    })
    db.commit()

    return one_student(form.id, db)



def student_delete(id,user, db):
    if one_student(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(Students).filter(Students.id == id).update({
        Students.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







