from fastapi import FastAPI
from pytz import timezone
import datetime

app = FastAPI()


def get_msk_time():
    return datetime.datetime.now().astimezone(timezone("Europe/Moscow"))


@app.get("/")
def read_root():
    return {"msktime": get_msk_time().strftime("%H:%M:%S")}
