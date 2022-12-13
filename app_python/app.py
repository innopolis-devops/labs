"""
Moscow time server
"""
import os
from datetime import datetime
from pytz import timezone
from flask import Flask, render_template
from prometheus_flask_exporter import PrometheusMetrics

FILE_NAME = "./files/time.txt"
VISITS_FILE = "./data/visits.log"

def create_app():
    """
    Create app function
    """
    flask_app = Flask(__name__, template_folder='./templates')
    metrics = PrometheusMetrics(flask_app) # pylint: disable=unused-variable
    zone = os.environ.get('TIMEZONE', 'Europe/Moscow')
    time_format = os.environ.get('TIME_FORMAT', '%H:%M:%S')
    zone = timezone(zone)

    @flask_app.route("/")
    def index():
        time = datetime.now(zone).strftime(time_format)
        directory = os.path.dirname(FILE_NAME)
        visits_dir = os.path.dirname(VISITS_FILE)

        if not os.path.exists(directory):
            os.makedirs(directory)
        with open(FILE_NAME, "a", encoding='utf-8') as file:
            file.write(str(datetime.now(zone)) + '</br>')

        if not os.path.exists(visits_dir):
            os.makedirs(visits_dir)
        with open(VISITS_FILE, 'w', encoding='utf-8') as file:
            file.write(time)
        return render_template('index.html', timezone_name=zone, time=time)

    @flask_app.route("/health")
    def health():
        return "OK"

    @flask_app.route('/visits')
    def visits():
        with open('./data/visits.log', 'r', encoding='utf-8') as file:
            return file.read()

    return flask_app


if __name__ == "__main__":
    app = create_app()
    app.run(port=8080, host="0.0.0.0", debug=True)
