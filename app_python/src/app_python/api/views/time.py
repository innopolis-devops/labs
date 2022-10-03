from datetime import datetime
from zoneinfo import ZoneInfo

from fastapi import APIRouter
from starlette import status

from app_python.api.utils import generate_responses_docs
from app_python.api.schemas import TimeResponse

router = APIRouter(tags=['time'])


@router.get(
    '',
    description='Returns current time.',
    response_model=TimeResponse,
    responses=generate_responses_docs(
        {
            status.HTTP_200_OK: {
                'description': 'Returns current time.',
                'examples': {
                    'Success': TimeResponse(time=datetime.now())
                }
            }
        }
    )
)
async def time(*, zone: str = 'Europe/Moscow') -> TimeResponse:
    return TimeResponse(time=datetime.now(ZoneInfo(zone)))
