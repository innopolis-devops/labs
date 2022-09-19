from fastapi import APIRouter
from app.services.moscow_time import MoscowTime

router = APIRouter()


@router.get("/")
def get_moscow_time() -> str:
    time = MoscowTime.now()
    return time
