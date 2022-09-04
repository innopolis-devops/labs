from datetime import datetime

import pytz
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

app = FastAPI()

tz = pytz.timezone("Europe/Moscow")


@app.get("/")
def read_root():
    time = datetime.now(tz)
    return PlainTextResponse(time.isoformat())
