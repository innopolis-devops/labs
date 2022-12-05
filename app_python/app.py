"""
Simple Flask app for showing time in Moscow
"""
from datetime import datetime, timedelta, timezone
from time import time

from flask import Flask, render_template
from prometheus_flask_exporter import PrometheusMetrics

flask_app = Flask(__name__)
metrics = PrometheusMetrics(flask_app)

offset = timedelta(hours=3)
tz = timezone(offset, name='MSK')


def get_time_str():
    '''
    Returns current time in Moscow
    '''
    return str(datetime.now(tz=tz))


@flask_app.route('/')
def display_time():
    '''
    Main function for default route.
    Places time in the template file
    '''
    with open('data/visits.log', 'w') as f:
        f.write(get_time_str())
    return render_template('template.html', datetime=get_time_str())


@flask_app.route('/health')
def health():
    '''
    Health check
    '''
    return 'OK'


@flask_app.route('/visits')
def visits():
    '''
    Return latest time from logfile
    '''
    with open('data/visits.log', 'r') as f:
        return f.read()


if __name__ == '__main__':
    flask_app.run(debug=True, host='0.0.0.0')
