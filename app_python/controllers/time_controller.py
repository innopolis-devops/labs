import pytz
from datetime import datetime

from utils.consts import DATE_TIME_FORMAT


def get_moscow_time() -> str:
    timezone = pytz.timezone('Europe/Moscow')
    time = datetime.now(timezone)
    return time.strftime(DATE_TIME_FORMAT)
