from fastapi import FastAPI

from models.usermodel import AuthUser

app = FastAPI()


@app.get("/")
async def root(arg):
    return {"message": "Hello World"}


@app.post("/auth")
async def auth_user(user: AuthUser):
    return {"user": user}
