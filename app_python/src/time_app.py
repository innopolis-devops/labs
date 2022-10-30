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


@app.route('/')
def time():
    now = datetime.now()
    return "Current time is: " + now.strftime("%H:%M:%S")


def application_available():
    return True, "Up time " + str((datetime.now() - time_start).days * 24)


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
