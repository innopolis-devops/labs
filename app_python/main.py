import pytz
from datetime import datetime

from flask import Flask, render_template


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
    return render_template("index.html",
                           the_title="It is Moscow time",
                           the_time=moscow_time)


@app.route("/<timezone>")
def show_user_time(timezone="Europe/Moscow"):
    timezone = timezone.replace("-", "/")
    try:
        user_clock = Clock(escape(timezone))
    except InvalidTimezoneError as err:
        return render_template("error.html",
                               the_title="Probably you did smth wrong",
                               error=err
                               )
    user_time = user_clock.bring_time()
    return render_template("index.html",
                           the_title=f"It is {timezone} time",
                           the_time=user_time)


if __name__ == "__main__":
    app.run(debug=False)