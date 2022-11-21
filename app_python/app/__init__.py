from datetime import datetime
from pathlib import Path

import pytz
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

tz = pytz.timezone("Europe/Moscow")

Path("./volume").mkdir(exist_ok=True)


@app.get("/")
def read_root():
    try:
        with open("./volume/visits", "r") as f:
            visits = int(f.read())
    except FileNotFoundError:
        visits = 0

    with open("./volume/visits", "w") as f:
        print(visits + 1, file=f)

    time = datetime.now(tz)
    return PlainTextResponse(time.isoformat())


@app.get("/visits")
def read_visits():
    try:
        with open("./volume/visits", "r") as f:
            visits = int(f.read())
    except FileNotFoundError:
        visits = 0

    return PlainTextResponse(str(visits))


@app.get("/healthcheck")
def healthcheck():
    return PlainTextResponse("ඞ")


@app.on_event("startup")
async def startup():
    Instrumentator().instrument(app).expose(app)
