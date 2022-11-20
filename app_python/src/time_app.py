from flask import Flask
from datetime import datetime
from flask import request
from healthcheck import HealthCheck
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)
health = HealthCheck()

time_start = datetime.now()
metrics.info('app_info', 'Application info', version='1.0.3')

VISITS_FILE_NAME = '/app/saved_visits_time.txt'


@app.route('/')
def time():
    now = datetime.now()
    save_visit()
    return "Current time is: " + now.strftime("%H:%M:%S")


@app.route('/visits')
def visits():
    visits = []
    with open(VISITS_FILE_NAME, 'r') as f:
        lines = f.readlines()
        for line in lines:
            visits.append(line[:-2])
    return visits


def application_available():
    return True, "Up time " + str((datetime.now() - time_start).days * 24)


def save_visit():
    try:
        with open(VISITS_FILE_NAME, 'a') as f:
            f.write(f"{str(datetime.now())}\n")
    except FileNotFoundError:
        with open('.' + VISITS_FILE_NAME, 'a') as f:
            f.write(f"{str(datetime.now())}\n")


health.add_check(application_available())

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=False)
    # Add a flask route to expose information
    app.add_url_rule("/healthcheck", "healthcheck", view_func=lambda: health.run())

    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )
