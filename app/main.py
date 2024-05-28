from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session

from .database import crud, models, schemas
from .database.database import SessionLocal, engine


from .dependencies import get_query_token, get_token_header

from .internals import admin
from .routers import items, users

models.Base.metadata.create_all(bind=engine)

app = FastAPI()
app.include_router(users.router)
app.include_router(items.router)
app.include_router(
    admin.router,
    prefix="/admin",
    tags=["admin"],
    dependencies=[Depends(get_token_header)],
    responses={418: {"description": "I'm a teapot"}},
)
