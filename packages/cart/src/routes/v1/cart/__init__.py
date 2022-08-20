from typing import List
from fastapi import APIRouter
from services.factory import CartServiceFactory

from schemas.user import UserSchema, UserPayload

cartRouter = APIRouter()
service = CartServiceFactory.create_service()


@cartRouter.get(path="/", response_model=List[UserSchema])
def get_cart():
    return service.retrieve_users()
    

@cartRouter.post(path='/', status_code=201)
def add_item_to_cart(payload: UserPayload):
    service.create_user(payload)
