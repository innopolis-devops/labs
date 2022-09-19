from datetime import datetime
import pytz
import requests

from flask import Flask

app = Flask(__name__)


@app.route('/')
def view_time():
    url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"
    response = requests.get(url, timeout=10)
    pattern = "%Y-%m-%dT%H:%M:%S.%f%z"
    if response.status_code == 200:
        date_time = datetime.strptime(response.json()["datetime"], pattern)
    else:
        date_time = datetime.now(pytz.timezone('Europe/Moscow'))
    time = f"{date_time.hour}:{date_time.minute}:{date_time.second}"
    return time
