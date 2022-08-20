from pydantic import BaseModel

class UserSchema(BaseModel):
    id: str
    first_name: str
    last_name: str
    age: int

class UserPayload(BaseModel):
    first_name: str
    last_name: str
    age: int
