from datetime import datetime

import pytz
from flask import Flask

app = Flask(__name__)


@app.route("/")
def show_moscow_time():

    # constant for timezone
    TIMEZONE = "Europe/Moscow"

    # get time and its fields
    time = datetime.now(tz=pytz.timezone(TIMEZONE))
    hours = time.hour
    minutes = time.minute
    seconds = time.second

    # construct result HTML soup and return it
    html = f"<center style='font-size: 60px;'>{hours}:{minutes}:{seconds}</center>"
    return html
