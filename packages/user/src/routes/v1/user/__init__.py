from typing import List
from fastapi import APIRouter
from services.factory import UserServiceFactory

from schemas.user import UserSchema, UserPayload

userRouter = APIRouter()
service = UserServiceFactory.create_service()


@userRouter.get(path="/", response_model=List[UserSchema])
def getUsers():
    return service.retrieve_users()
    

@userRouter.post(path='/', status_code=201)
def createUser(payload: UserPayload):
    service.create_user(payload)


@userRouter.put(path='/{id}')
def updateUser(id: int, payload: UserPayload):
    service.update_user(id, payload)


@userRouter.delete(path='/{id}', status_code=201)
def deleteUser(id:int):
    service.delete_user_by_id(id)