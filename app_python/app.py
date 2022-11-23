from flask import Flask
from datetime import datetime
import pytz
from prometheus_flask_exporter import PrometheusMetrics

LOG_FILENAME = './access.log'

app = Flask(__name__)
metrics = PrometheusMetrics(app)
tz_Moscow = pytz.timezone("Europe/Moscow")
metrics.register_default(
    metrics.counter(
        'by_path_counter', 'Request count by request paths',
        labels={'path': lambda: request.path}
    )
)

@app.route('/')
def start():
    # application code
    current_time = datetime.now(tz_Moscow).strftime("%H:%M:%S")
    with open(LOG_FILENAME, 'a') as file:
        file.write(current_time + '\n')
    return f"<center>Today in Moscow {current_time}</center>"

@app.route('/visits')
def show_visits():
    with open(LOG_FILENAME, 'r') as file:
        return '<div>'.join(file.readlines())


if __name__ == '__main__':
    app.run()

