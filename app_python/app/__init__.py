from flask import Flask
from datetime import datetime
from prometheus_flask_exporter import PrometheusMetrics
import pytz
from pathlib import Path

Path("./volume").mkdir(exist_ok=True)

app = Flask(__name__)
metrics = PrometheusMetrics(app)

metrics.info('app_info', 'Application info', version='1.0.3')


@app.route('/')
def index():
    try:
        with open("./volume/visits", "r") as f:
            visits = int(f.read())
    except FileNotFoundError:
        visits = 0
    with open("./volume/visits", "w") as f:
        f.write(str(visits + 1))
    return f'{datetime.now(pytz.timezone("Europe/Moscow"))}'


@app.route('/v')
def asdf():
    try:
        with open("./volume/visits", "r") as f:
            visits = int(f.read())
    except FileNotFoundError:
        visits = 0

    return str(visits)
