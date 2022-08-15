from http.client import HTTPException
from typing import List
from fastapi import APIRouter

from schemas.user import UserSchema, UserPayload
from repository import UserRepository

userRouter = APIRouter()
repository = UserRepository()


@userRouter.get(path="/", response_model=List[UserSchema])
def getUsers():
    return repository.retrieve_users()
    

@userRouter.post(path='/', status_code=201)
def createUser(payload: UserPayload):
    repository.create_user(payload)


@userRouter.put(path='/{id}')
def updateUser(id: int, payload: UserPayload):
    repository.update_user(id, payload)


@userRouter.delete(path='/{id}', status_code=201)
def deleteUser(id:int):
    repository.delete_user_by_id(id)