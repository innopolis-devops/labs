from datetime import datetime
import time
import sys

import pytz
from flask import Flask, request, Response
from jinja2 import Environment, PackageLoader, select_autoescape
import prometheus_client
from prometheus_client import Counter, Histogram

CONTENT_TYPE_LATEST = str('text/plain; version=0.0.4; charset=utf-8')

REQUEST_COUNT = Counter(
    'app_python_request_count', 'App Request Count',
    ['app_python', 'method', 'endpoint', 'http_status']
)
REQUEST_LATENCY = Histogram('app_python_request_latency_seconds', 'Request latency',
                            ['app_python', 'endpoint']
                            )

env = Environment(
    loader=PackageLoader("app"),
    autoescape=select_autoescape()
)


def start_timer():
    request.start_time = time.time()


def stop_timer(response):
    resp_time = time.time() - request.start_time
    REQUEST_LATENCY.labels('app_python', request.path).observe(resp_time)
    sys.stderr.write("Response time: %ss\n" % resp_time)
    return response


def record_request_data(response):
    REQUEST_COUNT.labels('app_python', request.method, request.path,
                         response.status_code).inc()
    sys.stderr.write("Request path: %s Request method: %s Response status: %s\n" %
                     (request.path, request.method, response.status_code))
    return response


def setup_metrics(app):
    app.before_request(start_timer)
    # The order here matters since we want stop_timer
    # to be executed first
    app.after_request(record_request_data)
    app.after_request(stop_timer)


app = Flask(__name__)
setup_metrics(app)


def get_current_moscow_time() -> str:
    return datetime.now(pytz.timezone('Europe/Moscow')).strftime("%H:%M:%S")


@app.route("/")
def main_page():
    template = env.get_template("main_page.html.jinja")
    return template.render(time=get_current_moscow_time())


@app.route('/metrics')
def metrics():
    return Response(prometheus_client.generate_latest(), mimetype=CONTENT_TYPE_LATEST)
