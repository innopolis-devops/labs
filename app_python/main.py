from fastapi import FastAPI
from datetime import datetime
import pytz

app = FastAPI()


def time():
    timezone = pytz.timezone('Europe/Moscow')

    return datetime.now(timezone).isoformat()


@app.get("/")
async def root():
    return {"time": f"{time()}"}
