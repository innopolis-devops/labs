import datetime
import pytz


class MoscowTime():
    def now():
        return datetime.datetime.now(pytz.timezone('Europe/Moscow')).strftime("%H:%M:%S, %m/%d/%Y")
