from datetime import datetime
import pytz


def get_timezone(continent, city):
    return pytz.timezone("{}/{}".format(continent, city))


def get_datetime_in_timezone(timezone):
    return datetime.now(timezone)


def format_time(datetime):
    return datetime.strftime("%H:%M:%S")


def get_time_in_moscow():
    tz = get_timezone("Europe", "Moscow")
    time = get_datetime_in_timezone(tz)
    return format_time(time)
