from datetime import datetime, timezone
import pytz


def get_msc_timezone() -> timezone:
    return pytz.timezone('Europe/Moscow')


def get_current_time() -> datetime:
    timezone = get_msc_timezone()
    return datetime.now(timezone)


def format_time(time: datetime) -> str:
    if time is None:
        raise TypeError
        
    datetime_format = '%m/%d/%Y, %H:%M:%S'
    return time.strftime(datetime_format)