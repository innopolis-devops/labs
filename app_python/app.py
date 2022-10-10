"""
This file manages requests for the time application
"""

from datetime import datetime
from flask import Flask, render_template
import pytz
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)



@app.route('/')
def moscow_time():
    """
    This method accepts GET-request and returns current time in Moscow
    """
    moscow_timezone = pytz.timezone('Europe/Moscow')
    msc_time = 'Current Moscow Time: ' + current_time(moscow_timezone)
    return render_template('index.html', moscow_time=msc_time)

@app.route("/health")
def health():
    return True


def current_time(timezone):
    """
    method returning current time for provided timezone
    """
    return datetime.now(timezone).strftime('%H:%M:%S')


if __name__ == '__main__':
    app.run()
