import json

from flask import Flask
from datetime import datetime
import pytz
from prometheus_flask_exporter import PrometheusMetrics
from pathlib import Path
import os

TIMEZONE = "Europe/Moscow"
TIME_FORMAT = "%d.%m.%Y %H:%M:%S"


def get_time(tz, tf):
    return datetime.now(pytz.timezone(tz)).strftime(tf)


def create_app():
    app = Flask(__name__)
    metrics = PrometheusMetrics(app)

    config_path = "config.json"
    with open(config_path) as f:
        config = json.loads(f.read())

    visits_dir = os.path.normpath(config['path'])
    visits_dir, visits_file = visits_dir.split(os.sep)
    Path(visits_dir).mkdir(parents=True, exist_ok=True)

    @app.route("/")
    def show_time():
        moscow_time = get_time(TIMEZONE, TIME_FORMAT)
        with open(config['path'], 'a') as f:
            f.write(moscow_time + '\n')
        html = "<center>" + moscow_time + "</center>"
        return html

    @app.route("/health")
    def health():
        return "200"

    @app.route("/visits")
    def visits():
        if os.path.exists(config['path']):
            with open(config['path'], "r") as f:
                visits_arr = f.readlines()
            return '<br>'.join(visits_arr)
        else:
            return "No visits"
    return app


if __name__ == "__main__":
    create_app().run()
