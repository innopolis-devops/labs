from datetime import datetime, timezone, timedelta
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse


app = FastAPI()


@app.get("/", response_class=PlainTextResponse)
def get_time():
    """
    Returns Moscow time
    """
    offset = timedelta(hours=3)
    return datetime.now(tz=timezone(offset)).strftime("%d-%m-%Y %H:%M:%S MSC")
