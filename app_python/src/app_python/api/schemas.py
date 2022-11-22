from uuid import UUID
from typing import Any, Literal, TypeVar
from datetime import datetime

import orjson
from pydantic import Extra, Field, BaseModel


def _orjson_dumps(*args, **kwargs) -> str:
    return orjson.dumps(*args, **kwargs).decode()


T = TypeVar('T', bound='FastPydanticBaseModel')


class FastPydanticBaseModel(BaseModel):
    def dict(self, *args, **kwargs) -> dict[str, Any]:
        kwargs['exclude_none'] = True
        return super().dict(*args, **kwargs)

    class Config:
        extra = Extra.forbid
        json_loads = orjson.loads
        json_dumps = _orjson_dumps


class APIHTTPError(FastPydanticBaseModel):
    """
    Represents API errors.
    """

    detail: str = Field(title='Information about the error.')
    request_id: UUID = Field(title='Unique identifier of the request')


class TimeResponse(FastPydanticBaseModel):
    """
    Represents API response.
    """

    time: datetime = Field(title='Current time.')


class StatusResponse(FastPydanticBaseModel):
    """
    Represents API response.
    """

    status: Literal['OK'] = Field(default='OK', title='Represent status of the service.')


class VisitsResponse(FastPydanticBaseModel):
    """
    Represents API response.
    """
    visits: list[datetime] = Field(title='List of visits.')
