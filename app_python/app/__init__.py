from flask import Flask
from datetime import datetime
from prometheus_flask_exporter import PrometheusMetrics
import pytz

app = Flask(__name__)
metrics = PrometheusMetrics(app)

metrics.info('app_info', 'Application info', version='1.0.3')


@app.route('/')
def index():
    return f'{datetime.now(pytz.timezone("Europe/Moscow"))}'
