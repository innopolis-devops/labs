from flask import Flask, render_template, request
import datetime
import requests
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/')
def show_moscow_time():
    offset = datetime.timezone(datetime.timedelta(hours=3))
    moscow_time = datetime.datetime.now(offset)
    print(type(moscow_time))
    return render_template('moscow_time.html', moscow_time=moscow_time, time=moscow_time.strftime("%H:%M:%S"))


if __name__ == '__main__':
    app.run()
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )
