"""This module provides a flask web server that shows current time in Moscow (MSK)"""

from datetime import datetime
import datetime as dt
from fastapi import FastAPI, Request

from fastapi.responses import HTMLResponse
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import settings
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates


def get_application() -> FastAPI:
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


templates = Jinja2Templates(directory="app/templates")


@app.get("/", response_class=HTMLResponse)
async def root(request: Request):
    return templates.TemplateResponse(
        "index.jinja", {"request": request, "time_msk": get_datetime()}
    )
