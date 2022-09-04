from datetime import datetime

import pytz
from fastapi import APIRouter
from fastapi.responses import HTMLResponse

from .config import config

tz = pytz.timezone(config.TIMEZONE)

router = APIRouter()


@router.get('/', response_class=HTMLResponse)
async def get_current_time():
    return f'<h1>{datetime.now(tz)}</h1>'
