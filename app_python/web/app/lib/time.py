import pytz


class TimeFormatter:
    def __init__(self, time_zone):
        self.time_zone = pytz.timezone(time_zone)
        self._format = '%Y:%m:%d %H:%M:%S %Z %z'

    @property
    def format(self):
        return self._format

    @format.setter
    def format(self, new_format):
        self._format = new_format

    def get_string(self, date):
        datetime_tz = date(self.time_zone)
        return datetime_tz.strftime(self._format)
