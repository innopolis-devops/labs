from flask import Flask, current_app
from prometheus_flask_exporter import PrometheusMetrics
from datetime import datetime, timedelta
from pytz import timezone
import requests
import iso8601
import json
import pprint


class Config:
    # File to store data about visits to "/" endpoint
    visits_file_path = "persistent/visits.json"


config = Config()
try:
    with open("config.json", "r") as conf_file:
        print("Reading config file")
        config_json = json.load(conf_file)
    expected_fields = [
        a
        for a in dir(config)
        if not a.startswith("__") and not callable(getattr(config, a))
    ]
    for f in expected_fields:
        if f in config_json:
            setattr(config, f, config_json[f])
except FileNotFoundError:
    print("Config not found, using default")

app = Flask(__name__)
app.config["CONFIG"] = config
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
    config: Config = current_app.config["CONFIG"]

    # Retrieve time
    moscow_dt = local_time_moscow()
    time_string = format_time(moscow_dt, "Moscow")

    # Create file if does not exist
    import os

    f = os.open(config.visits_file_path, os.O_CREAT)
    os.close(f)

    # Save page visit to file
    with open(config.visits_file_path, "r+") as f:
        try:
            current_visits = json.load(f)
        except json.decoder.JSONDecodeError:
            current_visits = None
        f.seek(0)
        if (
            current_visits is None
            or "list" not in current_visits
            or "total" not in current_visits
        ):

            # Initialize visits file contents
            current_visits = {"list": [], "total": 0}
        current_visits["list"].append(time_string)
        current_visits["total"] += 1
        json.dump(current_visits, f)
        f.truncate()

    return render_time_page(time_string)


@app.route("/status")
def status_check():
    try:
        return render_status_check()
    except Exception as e:
        app.logger.warn("Could not do status check: %s", e)
        return "Failed to perform status check", 503


@app.route("/visits")
def list_visits():
    config: Config = current_app.config["CONFIG"]
    try:
        with open(config.visits_file_path, "r") as f:
            v = json.load(f)
            result = "Total visits: " + str(v["total"]) + "<br>"
            result += "Entries:<br>"
            for entry in v["list"]:
                result += str(entry) + "<br>"
            return result
    except (FileNotFoundError, json.decoder.JSONDecodeError):
        return 'No visits to "/" detected'
