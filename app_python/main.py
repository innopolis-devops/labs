import pytz
from datetime import datetime
from flask import render_template
from flask import Flask

TIMEZONE = 'Europe/Moscow'
TIME_FORMAT = '%H:%M:%S'
VOLUME='volume/visits.txt'

app = Flask(__name__)


@app.route('/')
def hello_world():
    time = datetime.now(pytz.timezone(TIMEZONE)).strftime(TIME_FORMAT)

    with open(VOLUME, 'a') as f:
        f.write(time)
        f.write('\n')

    return render_template(
        'index.html',
        time=time
    )

@app.route('/visits')
def visits():
    with open(VOLUME, 'r') as f:
        visits = f.readlines()
    return '\n'.join(visits)

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)
