from datetime import datetime, timezone, timedelta
from flask import render_template_string, request
from prometheus_flask_exporter import PrometheusMetrics

from flask import Flask

app = Flask(__name__)

metrics = PrometheusMetrics(app)
metrics.info('app_info', 'Application info', version='0.1.0')

PAGE_SOURCE = '''
<!DOCTYPE html>
<html>
<head>
    <title>Lab 1</title>
</head>
<body>
    <h1>Current time: {{ time }}</h1>
</body>
</html>
'''


@app.route('/')
@metrics.counter('requests_total', 'Total requests', labels={
    'method': lambda: request.method,
    'endpoint': lambda: request.endpoint
})
def show_time():
    """
    Returns page with current time in UTC+3 (Europe/Moscow)
    :return: rendered page
    """
    offset = timedelta(hours=3)
    tm = datetime.now(tz=timezone(offset)).strftime('%H:%M:%S')
    return render_template_string(PAGE_SOURCE, time=tm)


if __name__ == '__main__':
    app.run(debug=False)
