from pydantic import BaseModel

class ValidateTokenPayload(BaseModel):
    last_name: str