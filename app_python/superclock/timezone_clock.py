import datetime

import pytz


class TimezoneClock:
    _tz: pytz.BaseTzInfo

    def __init__(self, timezone: str) -> None:
        self._tz = pytz.timezone(timezone)

    def get_utc(self) -> datetime.datetime:
        return datetime.datetime.utcnow().replace(tzinfo=datetime.timezone.utc)

    def get_datetime(self) -> datetime.datetime:
        return self.get_utc().astimezone(self._tz)

    def get_time_str(self) -> str:
        return self.get_datetime().strftime("%H:%M:%S")
