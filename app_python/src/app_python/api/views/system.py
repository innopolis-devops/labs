from fastapi import APIRouter

from app_python.api.schemas import StatusResponse

router = APIRouter(tags=['system'])


@router.get(
    '/status',
    description='Returns current system status.',
    response_model=StatusResponse
)
async def _status() -> StatusResponse:
    return StatusResponse()
