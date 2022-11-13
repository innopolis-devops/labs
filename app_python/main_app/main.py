from flask import Flask
from flask import request
import datetime
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route("/")
def hello_world():
    moscow_time_offset = datetime.timezone(datetime.timedelta(hours=3))
    now = datetime.datetime.now(moscow_time_offset)
    return "<h1>{0} : {1} : {2}</h1>".format(now.hour, now.minute, now.second)


if __name__ == '__main__':
    app.run()
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )
