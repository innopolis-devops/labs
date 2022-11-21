from datetime import datetime

import pytz
from fastapi import APIRouter
from fastapi.responses import HTMLResponse

from .config import config
from .utils import current_visits, increment_visits

tz = pytz.timezone(config.TIMEZONE)

router = APIRouter()


@router.get('/', response_class=HTMLResponse)
@increment_visits
async def get_current_time():
    return f'<h1>{datetime.now(tz)}</h1>'


@router.get('/visits', response_class=HTMLResponse)
async def get_visits():
    return f'<h1>Visits: {await current_visits()}</h1>'
