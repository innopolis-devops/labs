"""This module provides a flask web server that shows current time in Moscow (MSK)"""

from datetime import datetime
import datetime as dt
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import settings


def get_application():
    _app = FastAPI(title=settings.PROJECT_NAME)

    _app.add_middleware(
        CORSMiddleware,
        allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    return _app

offset = dt.timedelta(hours=3)
tz = dt.timezone(offset, name="MSK")

app = get_application()

def get_datetime():
    return str(datetime.now(tz=tz).strftime("%H:%M:%S"))

@app.get("/")
async def root():
    return {"message": get_datetime()}