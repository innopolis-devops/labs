"""
Moscow time server
"""
import os
from datetime import datetime
from pytz import timezone
from flask import Flask, render_template
from prometheus_flask_exporter import PrometheusMetrics

FILE_NAME = "./files/time.txt"

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
        if not os.path.exists(directory):
            os.makedirs(directory)
        with open(FILE_NAME, "a", encoding='utf-8') as file:
            file.write(str(datetime.now(zone)) + '</br>')
        return render_template('index.html', timezone_name=zone, time=time)
    return flask_app


if __name__ == "__main__":
    app = create_app()
    app.run(port=8080, host="0.0.0.0", debug=True)
