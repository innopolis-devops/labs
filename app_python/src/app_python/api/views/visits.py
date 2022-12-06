from datetime import datetime

import aiofiles
from fastapi import APIRouter
from starlette import status

from app_python import settings
from app_python.api.schemas import VisitsResponse

router = APIRouter(tags=['visits'])


@router.get(
    path='',
    description='Returns visits',
    response_model=VisitsResponse
)
async def get_visits() -> VisitsResponse:
    async with aiofiles.open(settings.visits_file) as file:
        visits = await file.readlines()

    return VisitsResponse(visits=[datetime.fromisoformat(visit.strip()) for visit in visits])


@router.post(
    path='',
    description='Log the time of the visit into the system.',
    status_code=status.HTTP_201_CREATED
)
async def add_visit() -> None:
    async with aiofiles.open(settings.visits_file, mode='a') as file:
        await file.write(f'{datetime.now()}\n')
