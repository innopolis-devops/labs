# import
from datetime import datetime
from flask import Flask
import requests

app = Flask(__name__)


@app.route("/")
def display_time():
    url = 'http://worldtimeapi.org/api/timezone/Europe/Moscow'  # link
    time_zone_moscow = requests.get(url)  # a request to retrieve the data
    if time_zone_moscow.status_code == 200:
        mask = '%Y-%m-%dT%H:%M:%S.%f%z'  # a mask for date and time
        current_time = datetime.strptime(
            time_zone_moscow.json()["datetime"],
            mask
        )  # convert the data
        return f"Date and time: {current_time}"  # return current date and time


if __name__ == "__main__":
    app.run()
