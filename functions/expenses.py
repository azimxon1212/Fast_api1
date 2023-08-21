from passlib.context import CryptContext
from sqlalchemy.orm import joinedload

import datetime
pwd_context = CryptContext(schemes=['bcrypt'])

from fastapi import HTTPException
from models.expenses import Expenses

from routes.auth import get_password_hash
from utils.pageination import pageination


def all_users(search, status, page,start_date, end_date, limit, db):
    if search:
        search_formatted = "%{}%".format(search)
        search_filter = Expenses.name.like(search_formatted) | Expenses.comment.like(search_formatted) | Expenses.type.like(
            search_formatted)
    else:
        search_filter = Expenses.id > 0
    if status in [True, False]:
        status_filter = Expenses.status == status
    else:
        status_filter = Expenses.id > 0

    try:
        if not start_date:
            start_date = datetime.date.min
        if not end_date:
            end_date = datetime.date.today()
        end_date = datetime.datetime.strptime(str(end_date), "%Y-%m-%d").date() + datetime.timedelta(days=1)
    except Exception as error:
        raise HTTPException(status_code=400, detail="Faqat yyy-mmm-dd formatida yozing")

    dones = db.query(Expenses).filter(Expenses.date > start_date).filter(
        Expenses.date <= end_date).filter(search_filter, status_filter).order_by(Expenses.id.desc())



    # users=db.query(Users).options(joinedload(Users.kpi), joinedload(Users.order.and_(Orders.status==True))).filter(search_filter, status_filter, roll_filter).order_by(Users.name.asc())
    # users = db.query(Expenses).options.filter(search_filter,
    #                                        status_filter,
    #                                        ).order_by(Expenses.id.desc())
    if page and limit:
        return pageination(dones, page, limit)
    else:
        return dones.all()


def one_expense(id, db):
    return db.query(Expenses).filter(Expenses.id == id).first()





def create_expense(form, user, db):
    # user_verification = db.query(Expenses).filter(Expenses.name == form.name).first()
    # if user_verification:
    #     raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")

    new_user_db = Expenses(
        money=form.money,
        comment=form.comment,
        type=form.type,
        teacher_id=form.teacher_id,
        status=form.status,

    )
    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)

    return new_user_db


def update_expenses(form, user, db):
    if one_expense(form.id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli foydalanuvchi mavjud emas")
    user_verification = db.query(Expenses).filter(Expenses.teacher_id == form.teacher_id).first()
    if user_verification and user_verification.id != form.id:
        raise HTTPException(status_code=400, detail="Bunday foydalanuvchi mavjud")

    db.query(Expenses).filter(Expenses.id == form.id).update({
        Expenses.id: form.id,
        Expenses.money: form.money,
        Expenses.comment: form.comment,
        Expenses.type:form.type,
        Expenses.teacher_id:form.teacher_id,
        Expenses.status: form.status,

    })
    db.commit()

    return one_expense(form.id, db)



def expense_delete(id,user, db):
    if one_expense(id, db) is None:
        raise HTTPException(status_code=400, detail="Bunday id raqamli ma'lumot mavjud emas")
    db.query(Expenses).filter(Expenses.id == id).update({
        Expenses.status: False,
    })
    db.commit()
    return {"date": "Ma'lumot o'chirildi !"}







