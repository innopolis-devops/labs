from datetime import datetime

from fastapi import FastAPI, Depends
from fastapi.responses import PlainTextResponse

from app.services import TimeService

# Initialize the time service before creating the app
time_service = TimeService.from_ntp("time.google.com")

app = FastAPI()


@app.get("/", response_class=PlainTextResponse)
async def show_time(time: datetime = Depends(time_service.get_real_time)):
    return time.ctime()
