from flask import Flask
from datetime import datetime
import pytz

TIMEZONE = "Europe/Moscow"
TIME_FORMAT = "%d.%m.%Y %H:%M:%S"


def get_time(tz, tf):
    return datetime.now(pytz.timezone(tz)).strftime(tf)


def create_app():
    app = Flask(__name__)

    @app.route("/")
    def show_time():
        moscow_time = get_time(TIMEZONE, TIME_FORMAT)
        html = "<center>" + moscow_time + "</center>"
        return html

    return app


if __name__ == "__main__":
    create_app().run()
