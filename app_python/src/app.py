from datetime import datetime
from flask import Flask, render_template
from src import consts
from prometheus_flask_exporter import PrometheusMetrics
from src.config import Config
from src import visists
import os
from pathlib import Path


def get_current_time() -> str:
    return datetime.now(consts.TIME_ZONE).strftime(consts.TIME_FORMAT)


def create_app():
    app = Flask(__name__, template_folder="../templates")
    config_path = Path(os.environ.get("CONFIG_PATH") or "config.json")
    config = Config.from_file(config_path)
    metrics = PrometheusMetrics(app)

    @app.route("/")
    def index():
        time = get_current_time()
        visists.add_entry(config=config, time=time)
        return render_template("index.html", time=time)

    @app.route("/health")
    def health():
        return "OK"

    @app.route("/visits")
    def visits():
        response = "\n".join(visists.Visits.from_file(config.visits_file_path).visits)
        return response, 200, {"Content-Type": "text/plain; charset=utf-8"}

    return app
