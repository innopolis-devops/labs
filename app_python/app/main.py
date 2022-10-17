from datetime import datetime
from fastapi import FastAPI, Request
import pytz
import logging

fmt = '%(asctime)s %(levelname)s [%(name)s] [%(funcName)s:%(lineno)s] %(message)s'
logging.basicConfig(filename='./log/main.log', level=logging.DEBUG, format=fmt)
logger = logging.getLogger(__name__)

app = FastAPI()


@app.get("/")
async def get_current_time(request: Request):
    ip = request.client.host
    logger.info(f"Request from {ip}")

    time_zone = pytz.timezone('Europe/Moscow')
    return {"current_time": datetime.now(tz=time_zone)}
