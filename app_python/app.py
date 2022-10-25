from flask import Flask
from datetime import datetime
import pytz
from prometheus_flask_exporter import PrometheusMetrics

TIMEZONE = "Europe/Moscow"
TIME_FORMAT = "%d.%m.%Y %H:%M:%S"


def get_time(tz, tf):
    return datetime.now(pytz.timezone(tz)).strftime(tf)


def create_app():
    app = Flask(__name__)
    metrics = PrometheusMetrics(app)

    @app.route("/")
    def show_time():
        moscow_time = get_time(TIMEZONE, TIME_FORMAT)
        html = "<center>" + moscow_time + "</center>"
        return html

    @app.route("/health")
    def health():
        return "200"

    return app


if __name__ == "__main__":
    create_app().run()
