import pytz
from flask import Flask
from datetime import datetime
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)


@app.route('/')
def show_time():
    return datetime.now(pytz.timezone("Europe/Moscow")).strftime("%H:%M:%S")


@app.route("/health")
def health():
    return "OK"


if __name__ == '__main__':
    app.run()
