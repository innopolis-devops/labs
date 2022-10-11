from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics
from datetime import datetime, timedelta
from pytz import timezone
import requests
import iso8601

app = Flask(__name__)
metrics = PrometheusMetrics(app)


def format_time(dt, timezone_name) -> str:
    return timezone_name + " time: " + dt.strftime("%H:%M:%S")


def render_time_page(time_string: str) -> str:
    return "<h1>" + time_string + "</h1>"


def local_time_moscow() -> datetime:
    return datetime.now(timezone("Europe/Moscow"))


def render_status_check() -> str:
    max_timedelta = timedelta(seconds=5)

    r = requests.get("http://worldtimeapi.org/api/timezone/Europe/Moscow")
    remote_time = r.json()["datetime"]
    remote_time = iso8601.parse_date(remote_time)

    local_time = local_time_moscow()
    diff = abs(remote_time - local_time)
    if diff < max_timedelta:
        return (
            "<h1>Local time is correct. Error ({}) is within boundary ({})</h1>".format(
                diff, max_timedelta
            )
        )
    else:
        return "<h1>Local time is incorrect. Difference with another time provider is {}</h1>".format(
            diff
        )


@app.route("/")
def hello_world():
    moscow_dt = local_time_moscow()
    time_string = format_time(moscow_dt, "Moscow")
    return render_time_page(time_string)


@app.route("/status")
def status_check():
    try:
        return render_status_check()
    except Exception as e:
        app.logger.warn("Could not do status check: %s", e)
        return "Failed to perform status check"
