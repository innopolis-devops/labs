from datetime import datetime
import pytz


def moscow_time():
    time_now = datetime.now(pytz.timezone('Europe/Moscow'))
    return time_now.strftime("%d/%m/%Y %H:%M:%S")
