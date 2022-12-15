"""Module gets time is Moscow and sets up flask webserver."""
from datetime import datetime
from flask import Flask
from pytz import timezone


MSK = timezone("Europe/Moscow")
app = Flask(__name__)


@app.route("/get_time")
def index():
    """Returns the moscow time page"""
    return f"<p>{get_moscow_time()}</p>"


def get_moscow_time():
    """Returns a string containing the current Moscow time"""
    datetime_msk = datetime.now(MSK)
    return datetime_msk.strftime("%Y:%m:%d %H:%M:%S %Z %z")
