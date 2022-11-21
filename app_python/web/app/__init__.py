import os
from app.lib.time import TimeFormatter
from app.lib.counter import VisitsCounter
from datetime import datetime

from flask import Flask
from flask import render_template
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

formatter = TimeFormatter('Europe/Moscow')
formatter.format = '%H:%M:%S'

counter = VisitsCounter(os.path.abspath('visits.json'))

@app.route('/')
def moscow_time():
    counter.count()
    time = formatter.get_string(datetime.now())
    return render_template('time.html', time=time)

@app.route('/visits')
def visit():
    return counter.get_json()