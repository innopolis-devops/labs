import datetime
import pytz

from app_python.errors import InvalidTimeZoneError


def create_time_zone(iana_time_zone):
    try:
        return pytz.timezone(iana_time_zone)
    except pytz.UnknownTimeZoneError:
        raise InvalidTimeZoneError(iana_time_zone)


class CurrentTimeInTimeZoneUseCase:
    def __init__(self, iana_time_zone: str) -> None:
        self.iana_time_zone = iana_time_zone

    def execute(self) -> datetime.datetime:
        time_zone = create_time_zone(self.iana_time_zone)
        time = datetime.datetime.now(time_zone)
        return time
