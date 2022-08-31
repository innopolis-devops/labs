from datetime import datetime
import pytz


class Clock():

    def __init__(self, *args):
        self.some_tz = args[0]

    def show_time(self):
        some_tz = pytz.timezone(self.some_tz)
        some_datetime = datetime.now(some_tz)
        print("{} time:".format(self.some_tz), some_datetime.strftime("%H:%M:%S"))


if __name__ == '__main__':
    moscow_time = Clock('Europe/Moscow')
    moscow_time.show_time()