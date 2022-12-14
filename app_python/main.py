from fastapi import FastAPI
from pytz import timezone
import datetime

app = FastAPI()
mem = "mem"


def get_visits():
    try:
        with open('./volume/visits.txt', 'r') as f:
            return int(f.read())
    except FileNotFoundError:
        return 0


def inc_visits():
    data = str(get_visits() + 1)
    with open('./volume/visits.txt', 'w') as f:
        f.write(data)


def get_msk_time():
    return datetime.datetime.now().astimezone(timezone("Europe/Moscow"))


@app.get("/")
def read_root():
    inc_visits()
    return {"msktime": get_msk_time().strftime("%H:%M:%S")}


@app.get("/visits")
def read_root():
    return {"visits": get_visits()}


@app.post("/outofmemory")
def read_root():
    global mem
    mem = mem * 2
    return {"length": len(mem)}
