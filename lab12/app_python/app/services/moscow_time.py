import datetime
import pytz


class MoscowTime:
    def __init__(self):
        return 
        
    def now(self):
        return datetime.datetime.now(pytz.timezone('Europe/Moscow')).strftime("%H:%M:%S, %m/%d/%Y")
