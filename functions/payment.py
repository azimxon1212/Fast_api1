from passlib.context import CryptContext
from sqlalchemy.orm import joinedload
import datetime

pwd_context = CryptContext(schemes=['bcrypt'])

from fastapi import HTTPException
from models.payment import Payment

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page,start_date, end_date, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Payment.name.like(search_formatted) | Payment.month.like(search_formatted) | Payment.fan_id.like(
            search_formatted)
    else:
        search_filter = Payment.id > 0
    if status in [True, False]:
        status_filter = Payment.status == status
    else:
        status_filter = Payment.id > 0

    try:
        if not start_date:
            start_date = datetime.date.min
        if not end_date:
            end_date = datetime.date.today()
        end_date = datetime.datetime.strptime(str(end_date), "%Y-%m-%d").date() + datetime.timedelta(days=1)
    except Exception as error:
        raise HTTPException(status_code=400, detail="Faqat yyy-mmm-dd formatida yozing")

    dones = db.query(Payment).options(joinedload(Payment.tolov)).filter(Payment.date > start_date).filter(
        Payment.date <= end_date).filter(search_filter, status_filter).order_by(Payment.id.desc())

    # users=db.query(Users).options(joinedload(Users.kpi), joinedload(Users.order.and_(Orders.status==True))).filter(search_filter, status_filter, roll_filter).order_by(Users.name.asc())
    # users = db.query(Payment).options.filter(search_filter,
    #                                        status_filter,
    #                                        ).order_by(Payment.id.desc())
    if page and limit:
        return pageination(dones, page, limit)
    else:
        return dones.all()


def one_payment(id, db):
    return db.query(Payment).filter(Payment.id == id).first()





def create_payment(form, user, db):
    user_verification = db.query(Payment).filter(Payment.name == form.name).first()
    if user_verification:
        raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")

    new_user_db = Payment(
        name=form.name,
        month=form.month,
        fan_id=form.fan_id,
        price=form.price,
        type=form.type,
        student_id=form.student_id,
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_payment(form, user, db):
    if one_payment(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli foydalanuvchi mavjud emas")
    user_verification = db.query(Payment).filter(Payment.surname == form.surname).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")

    db.query(Payment).filter(Payment.id == form.id).update({
        Payment.id: form.id,
        Payment.name: form.name,
        Payment.month: form.month,
        Payment.fan_id:form.fan_id,
        Payment.price:form.price,
        Payment.type:form.type,
        Payment.student_id:form.student_id,
        Payment.status: form.status,

    })
    db.commit()

    return one_payment(form.id, db)



def payment_delete(id,user, db):
    if one_payment(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(Payment).filter(Payment.id == id).update({
        Payment.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







