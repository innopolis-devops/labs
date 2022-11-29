from prometheus_flask_exporter import PrometheusMetrics
from flask import Flask, render_template, request
from datetime import datetime
import pytz
import json
import os


if __name__ == "__main__":
    app = Flask(__name__)
    metrics = PrometheusMetrics(app)

    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )

    @app.route("/")
    def index():
        current_timezone = pytz.timezone("Europe/Moscow")
        current_time = datetime.now(current_timezone).strftime("%H:%M:%S")
        log_time(current_time, "visits.json")
        return render_template("index.html", time=current_time)

    def log_time(time, log_file):
        if not os.path.exists(log_file):
            data = {"visits": []}
        else:
            with open(log_file, "r") as f:
                data = json.load(f)
        with open(log_file, "w+") as f:
            data["visits"].append(time)
            json.dump(data, f)

    @app.route('/visits')
    def get_visits() -> str:
        with open("visits.json", "r") as f:
            return json.load(f)

    app.run(host="127.0.0.1", port=8080)




