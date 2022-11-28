import pytz
from datetime import datetime

import flask
from flask import Flask, render_template, request, copy_current_request_context
from threading import Thread

app = Flask(__name__)


class InvalidTimezoneError(ValueError):
    def __init__(self, wrong_url: str):
        self.wrong_url = wrong_url

    def __str__(self):
        return f"Our website cannot recognize such timezone: {self.wrong_url}"


def set_timezone(some_zone):
    try:
        return pytz.timezone(some_zone)
    except pytz.UnknownTimeZoneError:
        raise InvalidTimezoneError(some_zone)


class Clock:
    def __init__(self, *args) -> None:
        self.some_tz = set_timezone(args[0])

    def print_time(self, format="%H:%M:%S") -> None:
        some_datetime = datetime.now(self.some_tz)
        print("{} time:".format(self.some_tz), some_datetime.strftime(format))

    def bring_time(self, format="%H:%M:%S") -> str:
        some_datetime = datetime.now(self.some_tz)
        return str(some_datetime.strftime(format))

    def bring_raw_time(self):
        return datetime.now(self.some_tz)


@app.route("/")
@app.route("/entry", methods=["POST"])
def show_moscow_time():
    moscow_clock = Clock("Europe/Moscow")
    moscow_time = moscow_clock.bring_time()

    @copy_current_request_context
    def save_logs(req: 'flask-request', res: str) -> None:
        with open("/app/visits/visit.txt", "a+") as file:
            file.write(str(req.remote_addr) + " " + str(res) + "\n")

    try:
        t = Thread(target=save_logs, args=(request, moscow_time))
        t.start()
    except Exception as err:
        print(err)
    return render_template("index.html",
                           the_title="It is Moscow time",
                           the_time=moscow_time)


@app.route('/visits')
def show_visits():
    try:
        stats = []
        with open("/app/visits/visit.txt") as file:
            for line in file.readlines():
                stats.append(line.split(' '))
        titles = ('address', 'time')
        return render_template('viewlog.html', the_title='View visits', the_row_titles=titles, the_data=stats)
    except Exception as err:
        print(err)
    return 'Error'


@app.route('/metrics')
def show_metrics():
    try:
        stats = []
        with open("/app/visits/visit.txt") as file:
            for line in file.readlines():
                stats.append(line.split(' '))
        titles = ('address', 'time')
        return render_template('viewlog.html', the_title='View visits', the_row_titles=titles, the_data=stats)
    except Exception as err:
        print(err)
    return 'Error'


if __name__ == "__main__":
    app.run(debug=False)