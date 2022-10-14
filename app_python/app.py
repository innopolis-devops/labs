from datetime import datetime

from fastapi import FastAPI, Depends
from fastapi.responses import PlainTextResponse

from dependencies import get_real_time

app = FastAPI()


@app.get("/", response_class=PlainTextResponse)
async def show_time(time: datetime = Depends(get_real_time)):
    return time.ctime()
