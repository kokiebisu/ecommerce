from typing import Any
from repository.session import SessionRepository


class SessionService:
    def __init__(self, repository: SessionRepository):
        self._repository = repository
    
    def get_session(self, session: str):
        if not session:
            raise Exception('session not provided')
        return self._repository.get_session(session)

    def update_session(self, session: str, data: Any):
        if not session:
            raise Exception('session not provided')
        return self._repository.update_session(session, data)
        
    def clean_sessions(self):
        return self._repository.clean_sessions()
