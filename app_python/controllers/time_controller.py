import pytz
from datetime import datetime

DATE_TIME_FORMAT = '%Y-%m-%dT%H:%M:%S'


def get_moscow_time() -> str:
    timezone = pytz.timezone('Europe/Moscow')
    time = datetime.now(timezone)
    return time.strftime(DATE_TIME_FORMAT)
