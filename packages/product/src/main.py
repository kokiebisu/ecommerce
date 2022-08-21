from fastapi import FastAPI

from routes.v1.products import productsRouter

app = FastAPI()

app.include_router(productsRouter)
