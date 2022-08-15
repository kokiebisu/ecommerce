
from fastapi import FastAPI

from routes.v1.user import userRouter

app = FastAPI()

app.include_router(userRouter)
