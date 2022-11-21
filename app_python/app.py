"""
This file manages requests for the time application
"""

from datetime import datetime
from flask import Flask, render_template
import pytz
import os
import json
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

LOG_FILE = "./visits.json"


@app.route('/')
def moscow_time():
    """
    This method accepts GET-request and returns current time in Moscow
    """
    moscow_timezone = pytz.timezone('Europe/Moscow')
    msc_time = 'Current Moscow Time: ' + current_time(moscow_timezone)
    logVisits(msc_time)
    return render_template('index.html', moscow_time=msc_time)


@app.route("/health")
def health():
    return True


@app.route("/visits")
def visits():
    safetyCheck()
    webPage = ""
    with open(LOG_FILE, 'r') as f:
        visitMap = json.load(f)
        for visitTime in visitMap["visitsList"]:
            webPage += str(visitTime) + "<br>"
        return webPage


def current_time(timezone):
    """
    method returning current time for provided timezone
    """
    return datetime.now(timezone).strftime('%H:%M:%S')


def logVisits(record: str):
    safetyCheck()
    visitJson = {}
    with open(LOG_FILE, "r") as fr:
        visitJson = json.load(fr)
        visitJson["visitsList"].append(record)
    with open(LOG_FILE, "w") as fw:
        json.dump(visitJson, fw)


def safetyCheck():
    if not os.path.exists(LOG_FILE):
        f = os.open(LOG_FILE, os.O_CREAT)
        os.close(f)

        with open(LOG_FILE, "w") as file:
            print("crate entries")
            visitsMap = {"visitsList": []}
            json.dump(visitsMap, file)


if __name__ == '__main__':
    app.run()
