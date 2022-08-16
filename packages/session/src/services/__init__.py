from typing import Any
from store import SessionStore


class SessionService:
    def __init__(self, store: SessionStore):
        self._store = store
    
    def validate_token(self, cookie: str):
        return self._store.validate_token(cookie)

    def update_token(self, cookie: str, data: Any):
        return self._store.update_token(cookie, data)
        
    def clean_sessions(self):
        return self._store.clean_sessions()  