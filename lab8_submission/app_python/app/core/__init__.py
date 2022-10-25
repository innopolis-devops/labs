from fastapi import FastAPI

import datetime
import pytz

app = FastAPI()


@app.get("/")
def read_root():
    return datetime.datetime.now(pytz.timezone('Europe/Moscow'))
