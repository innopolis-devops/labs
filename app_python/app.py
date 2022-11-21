import pytz
from flask import Flask
from datetime import datetime
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

metrics.info('app_info', 'Application info', version='1.0.3')


@app.route('/')
def show_time():
    time = datetime.now(pytz.timezone("Europe/Moscow")).strftime("%H:%M:%S")
    # write time to file
    with open('data/visits.log', 'w') as f:
        f.write(time)
    return time


@app.route("/health")
def health():
    return "OK"


@app.route('/visits')
def visits():
    # return time from file
    with open('data/visits.log', 'r') as f:
        return f.read()


if __name__ == '__main__':
    app.run()
