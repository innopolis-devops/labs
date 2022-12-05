from fastapi import APIRouter
from app.services.visits import Visits

router = APIRouter()

@router.get("/")
async def get_root() -> str:
    time = await Visits().add_visit()
    return time

@router.get("/visits")
async def get_visits() -> str:
    return await Visits().get_visits()

