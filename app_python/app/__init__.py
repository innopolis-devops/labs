from datetime import datetime

import pytz
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

tz = pytz.timezone("Europe/Moscow")


@app.get("/")
def read_root():
    time = datetime.now(tz)
    return PlainTextResponse(time.isoformat())


@app.get("/healthcheck")
def healthcheck():
    return PlainTextResponse("ඞ")


@app.on_event("startup")
async def startup():
    Instrumentator().instrument(app).expose(app)
