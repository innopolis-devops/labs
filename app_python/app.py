"""Creates a web app to show moscow time"""

from datetime import datetime
from flask import Flask
import pytz

app = Flask(__name__)


def get_time(time_format, timezone=pytz.timezone('UTC')):
    """Returns current time for timezone in needed format"""
    return datetime.now(timezone).strftime(time_format)


def get_moscow_time():
    """Returns current time in Moscow"""
    timezone = pytz.timezone('Europe/Moscow')
    time_format = "%b %d %Y %H:%M:%S"
    return get_time(time_format, timezone)


@app.route('/')
def home():
    """Main page"""
    return f"The current time in Moscow is {get_moscow_time()}"
