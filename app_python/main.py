from flask import Flask
from datetime import datetime
import pytz
from prometheus_flask_exporter import PrometheusMetrics
from healthcheck import HealthCheck

app = Flask(__name__)
metrics = PrometheusMetrics(app)
health = HealthCheck()
app.add_url_rule('/healthcheck', 'healthcheck', view_func=lambda: health.run())

storage_file = 'persistent/visits'

@app.route("/")
def index():
    timezone = pytz.timezone('Europe/Moscow')
    time = datetime.now(timezone).strftime("%Y-%m-%d %H:%M:%S")
    
    try:
        with open(storage_file, 'a') as file:
            file.write(str(time) + '\n')
    except FileNotFoundError:
        pass
    
    return str(time)

@app.route("/visits")
def visits():
    result = ''
    try:
        with open(storage_file, 'r') as file:
            lines = file.readlines()
            result = str(len(lines)) + ' entries<br>\n'
            for line in lines:
                result += line + '<br>\n'
    except FileNotFoundError:
        result = '0 entries<br>\n'
    return result

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080, debug=True)
