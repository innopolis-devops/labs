from flask import Flask
from datetime import datetime
from pytz import timezone

app = Flask(__name__)


def format_time(dt, timezone_name) -> str:
    return timezone_name + " time: " + dt.strftime("%H:%M:%S")


def render_time_page(time_string: str) -> str:
    return "<h1>" + time_string + "</h1>"


@app.route("/")
def hello_world():
    moscow_dt = datetime.now(timezone("Europe/Moscow"))
    time_string = format_time(moscow_dt, "Moscow")
    return render_time_page(time_string)
