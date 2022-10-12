from typing import Literal
from pydantic import BaseModel


class Status(BaseModel):
    status: Literal["ok"] = "ok"
    requests_served: int
