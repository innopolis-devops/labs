import datetime

import pytz
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, Response
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from .project import PROJECT_PATH

templates = Jinja2Templates(directory=PROJECT_PATH / "superclock/templates")

app = FastAPI()
app.mount("/static", StaticFiles(directory=PROJECT_PATH / "superclock/static"), name="static")


@app.get("/", response_class=HTMLResponse)
async def home(request: Request) -> Response:
    utctime = datetime.datetime.utcnow().replace(tzinfo=datetime.timezone.utc)
    msktime = utctime.astimezone(pytz.timezone("Europe/Moscow"))
    return templates.TemplateResponse("index.html", {"request": request, "msktime": msktime.strftime("%H:%M:%S")})
