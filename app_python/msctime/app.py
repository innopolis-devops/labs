from datetime import datetime
from flask import Flask, render_template
import requests

app = Flask(__name__)


@app.route("/", methods=("GET",))
def get_msc_time():
    """
    Shows current Moscow time
    :return: html page
    """
    response = requests.get("http://worldtimeapi.org/api/timezone/Europe/Moscow", timeout=60)
    if response.ok:
        date = datetime.strptime(response.json()["datetime"], "%Y-%m-%dT%H:%M:%S.%f%z")
        return render_template("index.html", date=date)

    return render_template("error.html", code=response.status_code)
