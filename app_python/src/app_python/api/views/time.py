from datetime import datetime
from zoneinfo import ZoneInfo

from fastapi import APIRouter

from app_python.api.schemas import TimeResponse

router = APIRouter(tags=['time'])


@router.get(
    path='',
    description='Returns current time.',
    response_model=TimeResponse
)
async def time(*, zone: str = 'Europe/Moscow') -> TimeResponse:
    return TimeResponse(time=datetime.now(ZoneInfo(zone)))
