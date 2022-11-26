from datetime import datetime

import pytz
from flask import Flask
from flask import request
from healthcheck import HealthCheck
from prometheus_flask_exporter import PrometheusMetrics
import json
import os

app = Flask(__name__)
metrics = PrometheusMetrics(app)

health = HealthCheck()

time_start = datetime.now()

VISITS_FILE = "/home/app/visits.json"


@app.route('/', methods=['GET'])
def time():
    content = """
         <html>
             <head>
                 <title>Time in UTC + 3</title>
             </head>
             <body>
                 <h1>%s</h1>
             </body>
         </html>
         """
    moscow = pytz.timezone('Europe/Moscow')
    time_format = '%Y-%m-%d %H:%M:%S %Z%z'
    saveVisit()
    return content % datetime.now(moscow).strftime(time_format)


@app.route('/visits', methods=['GET'])
def visits():
    checkExists()
    with open(VISITS_FILE, "r") as f:
        v = json.load(f)
        res = "Total " + str(v["totalVisits"]) + " <br>"
        res += "Entries: <br>"
        for entry in v["visitsList"]:
            res += str(entry) + "<br>"
        return res


def saveVisit():
    checkExists()

    current_state = {}
    with open(VISITS_FILE, "r") as fr:
        current_state = json.load(fr)

        moscow = pytz.timezone('Europe/Moscow')
        time_format = '%Y-%m-%d %H:%M:%S %Z%z'

        current_state["visitsList"].append(datetime.now(moscow).strftime(time_format))
        current_state["totalVisits"] += 1
    with open(VISITS_FILE, "w") as fw:
        json.dump(current_state, fw)


def checkExists():
    if not os.path.exists(VISITS_FILE):
        print("crate file")
        f = os.open(VISITS_FILE, os.O_CREAT)
        os.close(f)

        with open(VISITS_FILE, "w") as file:
            print("crate entries")
            visitsMap = {"visitsList": [], "totalVisits": 0}
            json.dump(visitsMap, file)



def app_available():
    return True, "Up time " + str((datetime.now() - time_start).days * 24)


health.add_check(app_available)

# Add a flask route to expose information
app.add_url_rule("/healthcheck", "healthcheck", view_func=lambda: health.run())

metrics.register_default(
    metrics.counter(
        'by_path_counter', 'Request count by request paths',
        labels={'path': lambda: request.path}
    )
)