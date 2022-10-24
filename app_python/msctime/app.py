from datetime import datetime
from flask import Flask, render_template
from prometheus_flask_exporter import PrometheusMetrics
from pytz import timezone

app = Flask(__name__)
metrics = PrometheusMetrics(app)


@app.route("/", methods=("GET",))
def get_msc_time():
    """
    Shows current Moscow time
    :return: html page
    """
    date = datetime.now(timezone('Europe/Moscow')).strftime('%H:%M:%S')

    return render_template("index.html", date=date)
