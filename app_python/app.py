"""
Author: Timur Nugaev, BS19-SD01
This module is the main module of the server
It is responsible for setting up and initialization of the whole thing
Second responsibility is to provide routes (I will separate it when I find out how)
"""

from flask import Flask, render_template, request
from datetime import datetime
import yaml
from prometheus_flask_exporter import PrometheusMetrics
from healthcheck import HealthCheck
from business_logic.time_logic import get_time

app = Flask(__name__, static_folder='static')
app.config["JSON_AS_ASCII"] = False
metrics = PrometheusMetrics(app)

VISITS_FILENAME = '/app_python/visits.txt'

health = HealthCheck()
tstart = datetime.now()


def availability():
    return True, f"uptime for: {str((datetime.now() - tstart).days * 24)}"


@app.route('/visits')
def get_visits():
    v = []
    with open(VISITS_FILENAME, 'r') as visits_file:
        ls = visits_file.readlines()
        for l in ls:
            v.append(l[:-2])
    return v


def save_visit():
    try:
        with open(VISITS_FILENAME, 'a') as visits_file:
            visits_file.write(f"{str(datetime.now())}\n")
    except FileNotFoundError:
        with open('.' + VISITS_FILENAME, 'a') as visits_file:
            visits_file.write(f"{str(datetime.now())}\n")


health.add_check(availability)


@app.route('/')
def get_home_page():
    """
    endpoint that returns a rendered html template with
    dynamic data (time) in the timezone of Moscow.
    :return: rendered template for home page
    """
    save_visit()
    return render_template('index.html', time_msk=get_time("Europe/Moscow"))


if __name__ == '__main__':
    with open("config.yml", "r", encoding="utf-8") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)

    HOST = config["flask"]["host"]
    PORT = config["flask"]["port"]  # pylint: disable=invalid-name

    app.add_url_rule("/healthcheck", "healthcheck", view_func=lambda: health.run())
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )
