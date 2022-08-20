
from fastapi import FastAPI

from routes.v1.cart import cartRouter

app = FastAPI()

app.include_router(cartRouter)
