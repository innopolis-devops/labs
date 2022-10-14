from flask import Flask
from datetime import datetime
import pytz
from prometheus_flask_exporter import PrometheusMetrics
from healthcheck import HealthCheck

app = Flask(__name__)
metrics = PrometheusMetrics(app)
health = HealthCheck()
app.add_url_rule('/healthcheck', 'healthcheck', view_func=lambda: health.run())


@app.route("/")
def index():
    timezone = pytz.timezone('Europe/Moscow')
    time = datetime.now(timezone).strftime("%Y-%m-%d %H:%M:%S")
    return str(time)


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080, debug=True)
