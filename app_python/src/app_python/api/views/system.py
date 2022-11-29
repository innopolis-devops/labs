from fastapi import APIRouter

from app_python.api.schemas import StatusResponse

router = APIRouter(tags=['system'])


@router.get(
    path='/status',
    description='Returns current system status.',
    response_model=StatusResponse
)
async def status() -> StatusResponse:
    return StatusResponse()
