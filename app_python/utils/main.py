from datetime import datetime
import pytz

def get_current_time_formatted():
    tz = pytz.timezone(config.TIMEZONE)
    return datetime.now(tz)