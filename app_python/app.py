# pylint: disable=missing-function-docstring
'''Render main page'''
from datetime import datetime
from flask import Flask
from flask import render_template
from pytz import timezone
import os

app = Flask(__name__)
app.static_folder = 'static'

os.makedirs('volume', exist_ok=True)
visits_file = 'volume/visits.txt'

@app.route("/")
def render_time_page():
    _date=datetime.now(timezone('Europe/Moscow'))
    with open(visits_file, 'a') as file:
        file.write(str(_date))
    return render_template("time.html", date = _date)

@app.route("/health")
def health():
    return "200"

@app.route("/visits")
def visits():
    with open(visits_file, 'r') as file:
        visits = file.read()
    return visits

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8000, debug=True)
