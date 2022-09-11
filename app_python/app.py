import pytz

from flask import Flask, render_template
from datetime import datetime


app = Flask(__name__)


def get_moscow_time():
    time_zone = pytz.timezone("Europe/Moscow")
    moscow_time = datetime.now(time_zone)
    return moscow_time


@app.route("/")
def index():
    app.logger.warning("It is a test warning!")
    time = "Hello world! Time is:" + get_moscow_time().strftime("%H:%M:%S")
    return render_template("template.html", time=time)


if __name__ == "__main__":
    app.run("localhost", 8000)
