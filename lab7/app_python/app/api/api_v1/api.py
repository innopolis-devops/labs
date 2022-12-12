from fastapi import APIRouter

from app.api.api_v1.endpoints import moscow_time


api_router = APIRouter()
api_router.include_router(moscow_time.router, prefix="/moscow_time", tags=["moscow_time"])
