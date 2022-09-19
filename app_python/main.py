import pytz
from datetime import datetime
from flask import render_template
from flask import Flask

TIMEZONE = 'Europe/Moscow'
TIME_FORMAT = '%H:%M:%S'

app = Flask(__name__)


@app.route('/')
def hello_world():
    return render_template(
        'index.html',
        time=datetime.now(pytz.timezone(TIMEZONE)).strftime(TIME_FORMAT)
    )


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)
