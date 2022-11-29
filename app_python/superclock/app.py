import os
from typing import List
import datetime

from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, Response
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from prometheus_fastapi_instrumentator import Instrumentator

from .metrics import http_requested_languages_total
from .project import PROJECT_PATH
from .timezone_clock import TimezoneClock

os.makedirs("storage", exist_ok=True)
app = FastAPI()
app.mount("/static", StaticFiles(directory=PROJECT_PATH / "superclock/static"), name="static")
templates = Jinja2Templates(directory=PROJECT_PATH / "superclock/templates")

msk_clock = TimezoneClock("Europe/Moscow")


class VisitorInfo(BaseModel):
    requested_page: str
    client: str
    time: datetime.datetime


@app.get("/", response_class=HTMLResponse)
async def home(request: Request) -> Response:
    with open("storage/visits.txt", "a+", encoding="utf8") as f:
        client = request.client.host if request.client is not None else None
        f.write(VisitorInfo(requested_page="/", client=client, time=msk_clock.get_datetime()).json() + "\n")
    return templates.TemplateResponse("index.html", {"request": request, "msktime": msk_clock.get_time_str()})


@app.get("/visits")
async def visits() -> List[VisitorInfo]:
    try:
        with open("storage/visits.txt", "rb") as f:
            return [VisitorInfo.parse_raw(i) for i in f.read().split(b"\n")[:-1]]
    except FileNotFoundError:
        return []


@app.get("/healthy")
async def healthy() -> str:
    return "ok"


@app.on_event("startup")
async def startup() -> None:
    Instrumentator().add(http_requested_languages_total()).instrument(app).expose(app)
