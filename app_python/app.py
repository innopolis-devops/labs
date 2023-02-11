from flask import Flask
from datetime import datetime
from pytz import timezone
import os.path

app = Flask(__name__)


@app.route('/')
def time():
    new_visit()
    current_time = datetime.now(timezone('Europe/Moscow')).strftime('%H:%M:%S')
    return current_time


@app.route("/visits")
def get_visits():

    return f"Visits: {get_visits()}"


def new_visit():
    visits = get_visits()
    f = open("visits.data", "w")
    visits += 1
    f.write(str(visits))
    f.close()


def get_visits():
    if not os.path.isfile("visits.data"):
        f = open("visits.data", "w")
        f.write("0")
        f.close()
    f = open("visits.data", "r")
    visits = int(f.read())
    f.close()
    return visits


if __name__ == '__main__':
    app.run(host="0.0.0.0")
