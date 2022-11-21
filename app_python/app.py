from flask import Flask, render_template
from datetime import datetime
import pytz
import json
from prometheus_flask_exporter import PrometheusMetrics
from pathlib import Path


def log_time_to_file(time):
    if not Path("visits.json").exists():
        data = {"visits": []}
    else:
        with open("visits.json", "r") as f:
            data = json.load(f)
    with open("visits.json", "w+") as f:
        data["visits"].append(time)
        json.dump(data, f)


def create_app():
    app = Flask(__name__)
    metrics = PrometheusMetrics(app)

    @app.route('/health')
    def get():
        pass

    @app.route('/')
    def get_moscow_time() -> str:
        time = datetime.now(pytz.timezone("Europe/Moscow")).strftime("%H:%M:%S")
        log_time_to_file(time)
        return render_template("time.html", time=time)

    @app.route('/visits')
    def get_visits() -> str:
        with open("visits.json", "r") as f:
            return json.load(f)

    return app
