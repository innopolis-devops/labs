from fastapi import APIRouter
from app.services.visits import Visits

router = APIRouter()

@router.get("/")
def get_root() -> str:
    time = Visits().add_visit()
    return time

@router.get("/visits")
def get_visits() -> str:
    return Visits().get_visits()

