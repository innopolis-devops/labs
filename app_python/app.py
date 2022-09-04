import datetime

import pytz
import requests
from flask import Flask

app = Flask(__name__)


@app.route("/")
def moscow_time():
    url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"
    response = requests.get(url)
    pattern = "%Y-%m-%dT%H:%M:%S.%f%z"
    if response.status_code == 200:
        date = datetime.datetime.strptime(response.json()["datetime"], pattern)
        time = f"{date.hour}:{date.minute}:{date.second}"
    else:
        dttm = datetime.datetime.now(pytz.timezone("Europe/Moscow"))
        time = f"{dttm.hour}:{dttm.minute}:{dttm.second}"

    return f"Moscow time: {time}"
