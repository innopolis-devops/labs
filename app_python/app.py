from flask import Flask
from datetime import datetime
import pytz

app = Flask(__name__)


def get_time(format, timezone=pytz.timezone('UTC')):
    return datetime.now(timezone).strftime(format)


def get_moscow_time():
    timezone = pytz.timezone('Europe/Moscow')
    format = "%b %d %Y %H:%M:%S"
    return get_time(format, timezone)


@app.route('/')
def home():
    return f"The current time in Moscow is {get_moscow_time()}"
