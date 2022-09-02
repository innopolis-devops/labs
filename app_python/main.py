from datetime import datetime
import pytz

import flask
from flask import Flask, render_template

app = Flask(__name__)


class Clock():
    def __init__(self, *args):
        self.some_tz = pytz.timezone(args[0])

    def print_time(self, format="%H:%M:%S"):
        some_datetime = datetime.now(self.some_tz)
        print("{} time:".format(self.some_tz), some_datetime.strftime(format))

    def bring_time(self, format="%H:%M:%S"):
        some_datetime = datetime.now(self.some_tz)
        return str(some_datetime.strftime(format))


@app.route('/')
@app.route('/entry', methods=['POST'])
def show_time() -> 'html':
    moscow_clock = Clock('Europe/Moscow')
    moscow_time = moscow_clock.bring_time()
    return render_template('entry.html',
                           the_title='It is Moscow time',
                           the_time=moscow_time)


if __name__ == '__main__':
    app.run(debug=True)