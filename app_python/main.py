from fastapi import FastAPI
from pytz import timezone
import datetime

app = FastAPI()


@app.get("/")
def read_root():
    time = datetime.datetime.now().astimezone(timezone("Europe/Moscow"))
    return {"msktime": time.strftime("%H:%M:%S")}
