import pytz
from datetime import datetime


def moscow_time():
    time_now = datetime.now(pytz.timezone('Europe/Moscow'))
    return time_now.strftime("%d/%m/%Y %H:%M:%S")
