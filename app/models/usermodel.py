from fastapi import FastAPI
from pydantic import Field, BaseModel, EmailStr


class AuthUser(BaseModel):
    username: str
    password: str


class UserIn(BaseModel):
    firstName: str
    lastName: str
    username: str
    password: str
    email: EmailStr
    phoneNumber: str


class UserOut(BaseModel):
    username: str
    email: EmailStr


class UserInDB(BaseModel):
    username: str
    hashed_password: str
    email: EmailStr


def fake_password_hasher(raw_password: str):
    return "supersecret" + raw_password


def fake_save_user(user_in: UserIn):
    hashed_password = fake_password_hasher(user_in.password)
    user_in_db = UserInDB(**user_in.dict(), hashed_password=hashed_password)
    print("User saved! ..not really")
    return user_in_db
