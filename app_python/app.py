"""This module shows Moscow Time."""
from datetime import datetime
from flask import Flask

import requests

app = Flask(__name__)


@app.route('/')
def moscow_time():
    url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"
    response = requests.get(url)
    pattern = "%Y-%m-%dT%H:%M:%S.%f%z"
    if response.status_code == 200:
        date = datetime.datetime.strptime(response.json()["datetime"], pattern)
        time = f"{date.hour}:{date.minute}:{date.second}"
    return f"Moscow time: {time}"
