from flask import Flask, request
import requests
import datetime
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)


@app.route('/')
def index():
    url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"
    response = requests.get(url)
    if response.status_code == 200:
        pattern = "%Y-%m-%dT%H:%M:%S.%f%z"
        date = datetime.datetime.strptime(response.json()["datetime"], pattern)
        time = f"{date.hour}:{date.minute}:{date.second}"
        return "<h1>Current Moscow time: " + time + "</h1>"
    else:
        return "Error occurred: server code {0}".format(response.status_code)


if __name__ == "__main__":
    app.run()
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )
