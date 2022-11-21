from datetime import datetime
from fastapi import FastAPI, Request, Response
import pytz
import logging
import os

fmt = '%(asctime)s %(levelname)s [%(name)s] [%(funcName)s:%(lineno)s] %(message)s'
logging.basicConfig(filename='./log/main.log', level=logging.DEBUG, format=fmt)
logger = logging.getLogger(__name__)

os.makedirs('data', exist_ok=True)
VISITS_FILE = 'data/visits.txt'

app = FastAPI()


@app.get("/")
async def get_current_time(request: Request):
    ip = request.client.host
    logger.info(f"Request time from {ip}")

    time_zone = pytz.timezone('Europe/Moscow')
    now = datetime.now(tz=time_zone)

    with open(VISITS_FILE, 'a') as file:
        file.write(str(now) + '\n')

    return {"current_time": now}


@app.get("/visits")
async def get_visits(request: Request):
    ip = request.client.host
    logger.info(f"Request visits from {ip}")

    with open(VISITS_FILE, 'r') as file:
        visits = file.read()

    return Response(content=visits, media_type='text/plain')
