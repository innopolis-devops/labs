import json
from datetime import datetime
from flask import Flask, render_template
from prometheus_flask_exporter import PrometheusMetrics
from pytz import timezone
from msctime.config import Config

app = Flask(__name__)
metrics = PrometheusMetrics(app)
config = Config()


@app.route("/", methods=("GET",))
def get_msc_time():
    """
    Shows current Moscow time
    :return: html page
    """
    date = datetime.now(timezone('Europe/Moscow')).strftime('%H:%M:%S')
    write_persistent(date)

    return render_template("index.html", date=date)


@app.route("/visits", methods=("GET",))
def show_persistent():
    """
    Shows content of persistent file
    :return: json with times and number of visits
    """
    try:
        with open(config.persistent_path, "r", encoding="utf-8") as f:
            return json.load(f)
    except FileNotFoundError:
        return "No visits to '/' detected"
    except json.JSONDecodeError:
        return "Error occurred while decoding json"


def write_persistent(date):
    """
    Write date to persistent file
    :param date: Moscow time
    :return: None
    """

    # Creating file if it is not exist
    open(config.persistent_path, "a+", encoding="utf-8").close()

    with open(config.persistent_path, "r+", encoding="utf-8") as f:
        try:
            current_visits = json.load(f)
        except json.decoder.JSONDecodeError:
            current_visits = None

        f.seek(0)
        if current_visits is None or "times" not in current_visits or "total" not in current_visits:
            current_visits = {"times": [], "total": 0}

        current_visits["times"].append(date)
        current_visits["total"] += 1
        json.dump(current_visits, f)
        f.truncate()
