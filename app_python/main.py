from flask import Flask
import requests
import datetime

app = Flask(__name__)


@app.route('/')
def index():
    url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"
    response = requests.get(url)
    if response.status_code == 200:
        pattern = "%Y-%m-%dT%H:%M:%S.%f%z"
        date = datetime.datetime.strptime(response.json()["datetime"], pattern)
        time = f"{date.hour}:{date.minute}:{date.second}"
        return "<h1>Current Moscow time: " + time + "</h1>"
    else:
        return "Error occurred: server code {0}".format(response.status_code)


if __name__ == "__main__":
    app.run()
