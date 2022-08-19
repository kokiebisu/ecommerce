from typing import Union
from fastapi import FastAPI, Header

from services import SessionService
from schemas import ValidateTokenPayload
from store import SessionStore

app = FastAPI()
store = SessionStore()
service = SessionService(store)

@app.get('/')
def validate_token(cookie: Union[str, None] = Header(default=None)):
    return service.validate_token(cookie)

@app.post('/')
def validate_token(item: ValidateTokenPayload, cookie: Union[str, None] = Header(default=None)):
    print("ITEM", item)
    print("COOkie", cookie)
    return service.update_token(cookie, item)
