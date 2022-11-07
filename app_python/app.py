"""Creates a web app to show moscow time"""

from datetime import datetime
from flask import Flask, request
import pytz
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)


def get_time(time_format, timezone=pytz.timezone('UTC')):
    """Returns current time for timezone in needed format"""
    return datetime.now(timezone).strftime(time_format)


def get_moscow_time():
    """Returns current time in Moscow"""
    timezone = pytz.timezone('Europe/Moscow')
    time_format = "%b %d %Y %H:%M:%S"
    return get_time(time_format, timezone)


@app.route('/')
def home():
    """Main page"""
    return f"The current time in Moscow is {get_moscow_time()}"


metrics.register_default(
    metrics.counter(
        'by_path_counter', 'Request count by request paths',
        labels={'path': lambda: request.path}
    )
)
