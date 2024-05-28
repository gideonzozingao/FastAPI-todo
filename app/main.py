from fastapi import FastAPI

from models.usermodel import AuthUser

app = FastAPI()


@app.get("/health")
async def root():
    return {"message": "Api is running"}


@app.post("/auth")
async def auth_user(user: AuthUser):
    return {"user": user}
