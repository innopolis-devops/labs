import datetime

import pytz
from flask import Flask

app = Flask(__name__)


@app.route("/")
def moscow_time():
    dttm = datetime.datetime.now(pytz.timezone("Europe/Moscow"))
    time = f"{dttm.hour}:{dttm.minute}:{dttm.second}"
    return f"<h2>Moscow time: {time}</h2>"
