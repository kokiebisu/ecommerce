from typing import List
from fastapi import APIRouter

productsRouter = APIRouter()

@productsRouter.get(path="/", response_model=str)
def hello():
    """A simple response"""
    return "Hello World"
