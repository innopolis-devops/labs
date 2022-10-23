from flask import Flask, Blueprint, request, Response
from datetime import datetime
from zoneinfo import ZoneInfo
from sys import version_info

# for metrics
from prometheus_client import Counter, Histogram, generate_latest
CONTENT_TYPE = str('text/plain; version=0.0.4; charset=utf-8')
REQUEST_COUNT = Counter(
    'request_count', 'App Request Count',
    ['app_name', 'method', 'endpoint', 'http_status']
)

bp = Blueprint('app', __name__)

@bp.route('/')
def main():
    time_msc = datetime.now(ZoneInfo("Europe/Moscow")).time()
    return ("Moscow time: " +
        time_msc.isoformat(timespec='seconds') +
        "<br><br>(the time is actual for the last webpage load)")

@bp.route('/metrics')
def stats():
    return Response(generate_latest(), mimetype=CONTENT_TYPE)

# save metrics to Prometheus Client
def save_metric(response):
    REQUEST_COUNT.labels('py_app', request.method, request.path, response.status_code).inc()
    return response

def create_app(config=None):
    app = Flask(__name__)
    app.register_blueprint(bp)
    app.after_request(save_metric)
    return app

if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0") if version_info >= (3, 9) else \
    print("Error: zoneinfo requires Python 3.9 or newer")