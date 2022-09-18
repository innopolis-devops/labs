from fastapi import FastAPI
from datetime import datetime
import pytz

fast_api = FastAPI()


@fast_api.get("/")
def time_server():
    current_time = datetime.now(pytz.timezone('Europe/Moscow'))
    format_string = "Today is %d/%m/%Y! Time is %H:%M:%S, have a nice day :)"
    return current_time.strftime(format_string)
