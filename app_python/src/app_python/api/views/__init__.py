from fastapi import APIRouter

router = APIRouter()

from app_python.api.views.time import router as detect
from app_python.api.views.system import router as system
from app_python.api.views.visits import router as visits

router.include_router(detect, prefix='/time')
router.include_router(system, prefix='/system')
router.include_router(visits, prefix='/visits')
