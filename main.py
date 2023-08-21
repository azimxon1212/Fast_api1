from db import SessionLocal
from fastapi import FastAPI
# from fastapi_utils.tasks import repeat_every
from sqlalchemy.orm import Session

from models.users import Users
from routes import users, auth,teachers,students,sciences,room,payment,expenses,courses_dates,courses
from db import Base, engine
import datetime

from routes.auth import get_password_hash

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="FastApi",
)

from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=['*'],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get('/')
def home():
    return {"Welcome": "Xush Kelibsiz"}


app.include_router(
    auth.login_router,
    prefix='/auth',
    tags=['User auth section'],
    responses={200: {'description': 'Ok'}, 201: {'description': 'Created'}, 400: {'description': 'Bad Request'},
               401: {'desription': 'Unauthorized'}}
)

app.include_router(
    users.router_user,
    prefix='/user',
    tags=['User section'],
    responses={200: {'description': 'Ok'}, 201: {'description': 'Created'}, 400: {'description': 'Bad Request'},
               401: {'desription': 'Unauthorized'}}
)

app.include_router(
    router=teachers.router_teacher,
    tags=["Teachers section"],
    prefix='/teachers'
)

app.include_router(
    router=students.student_router,
    tags=["Students section"],
    prefix='/students'
)

app.include_router(
    router=sciences.science_router,
    tags=["Sciences section"],
    prefix='/sciences'
)

app.include_router(
    router=room.room_router,
    tags=["Rooms section"],
    prefix='/rooms'
)

app.include_router(
    router=payment.payment_router,
    tags=["Payments section"],
    prefix='/payment'
)

app.include_router(
    router=expenses.expenses_router,
    tags=["Expenses section"],
    prefix='/expenses'
)

app.include_router(
    router=courses_dates.courses_date_router,
    tags=["Courses_dates section"],
    prefix='/courses_dates'
)

app.include_router(
    router=courses.courses_router,
    tags=["Courses section"],
    prefix='/courses'
)

try:
    db = SessionLocal()
    new_user_db = Users(
        name='www',
        username='www',
        number='form.number',
        password=get_password_hash('111'),
        roll='www',
        status=True,

    )

    db.add(new_user_db)
    db.commit()
    db.refresh(new_user_db)
except Exception as x:
    print(x, 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
