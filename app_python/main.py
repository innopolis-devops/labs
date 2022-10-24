from prometheus_flask_exporter import PrometheusMetrics
from flask import Flask, render_template, request
from datetime import datetime
import pytz

app = Flask(__name__)
metrics = PrometheusMetrics(app)


@app.route("/")
def index():
    current_timezone = pytz.timezone("Europe/Moscow")
    current_time = datetime.now(current_timezone).strftime("%H:%M:%S")
    return render_template("index.html", time=current_time)


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080)
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )

