"""Module gets time is Moscow and sets up flask webserver."""
from datetime import datetime
from flask import Flask
from pytz import timezone
import os.path


MSK = timezone("Europe/Moscow")
app = Flask(__name__)


@app.route("/get_time")
def index():
    """Returns the moscow time page"""
    new_visit()
    return f"<p>{get_moscow_time()}</p>"


@app.route("/visits")
def get_visits():
    """Returns the number of visits to the website"""
    new_visit()
    return f"<h2>Website has been visited {get_visits()} times!</h2>"


def get_moscow_time():
    """Returns a string containing the current Moscow time"""
    datetime_msk = datetime.now(MSK)
    return datetime_msk.strftime("%Y:%m:%d %H:%M:%S %Z %z")


def new_visit():
    """Increases the number of visits to the website by 1"""
    visits = get_visits()
    f = open("visits.data", "w")
    visits += 1
    f.write(str(visits))
    f.close()


def get_visits():
    """Gets the current number of visits to the website"""
    if not os.path.isfile("visits.data"):
        f = open("visits.data", "w")
        f.write("0")
        f.close()
    f = open("visits.data", "r")
    visits = int(f.read())
    f.close()
    return visits
