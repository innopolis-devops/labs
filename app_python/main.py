from datetime import datetime
from fastapi import FastAPI
import pytz

app = FastAPI()


@app.get("/")
async def get_current_time():
    time_zone = pytz.timezone('Europe/Moscow')
    return {"current_time": datetime.now(tz=time_zone)}
