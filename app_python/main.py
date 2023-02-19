from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

import os
import time_utils

# flask server entry point
app = Flask(__name__)
metrics = PrometheusMetrics(app)

# index page callback
@app.route("/")
def default_page():
    if os.path.exists("count.txt"):
        with open("count.txt", "r") as file:
            count = int(file.read())
    else:
        count = 0
    with open("count.txt", "w") as file:
        file.write(str(count + 1))
        
    return """
    <html>
        <head>
            <style>
                h1 {{text-align: center;}}
            </style>
        </head>
        <body>
            <h1>Current time in Moscow: {}</h1>
        </body>
    </html>
    """.format(time_utils.get_time_in_moscow())

@app.route("/visits")
def popularity():
    if os.path.exists("count.txt"):
        with open("count.txt", "r") as file:
            count = int(file.read())
    else:
        count = 0
    return """
    <html>
        <head>
            <style>
                h1 {{text-align: center;}}
            </style>
        </head>
        <body>
            <h1>Time was requested times: {}</h1>
        </body>
    </html>
    """.format(count)
