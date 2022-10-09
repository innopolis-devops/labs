from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, Response
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from prometheus_fastapi_instrumentator import Instrumentator

from .project import PROJECT_PATH
from .timezone_clock import TimezoneClock

app = FastAPI()
app.mount("/static", StaticFiles(directory=PROJECT_PATH / "superclock/static"), name="static")
templates = Jinja2Templates(directory=PROJECT_PATH / "superclock/templates")

msk_clock = TimezoneClock("Europe/Moscow")


@app.get("/", response_class=HTMLResponse)
async def home(request: Request) -> Response:
    return templates.TemplateResponse("index.html", {"request": request, "msktime": msk_clock.get_time_str()})


@app.on_event("startup")
async def startup() -> None:
    Instrumentator().instrument(app).expose(app)
