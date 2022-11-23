"""This module shows Moscow Time."""
from datetime import datetime
from flask import Flask
import os

import requests

os.makedirs('volume', exist_ok=True)
visits_file = 'volume/visits.txt'

app = Flask(__name__)


@app.route('/')
def moscow_time():
    url = "http://worldtimeapi.org/api/timezone/Europe/Moscow"
    response = requests.get(url)
    pattern = "%Y-%m-%dT%H:%M:%S.%f%z"
    if response.status_code == 200:
        date = datetime.strptime(response.json()['datetime'], pattern)
        time = f"{date.hour}:{date.minute}:{date.second}"

    with open(visits_file, 'a') as file:
        file.write(date + ' ' + time + '\n')

    return f"Moscow time: {time}"

@app.route("/visits")
def visits():

    with open(visits_file, 'r') as file:
        visits = file.read()

    return visits

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
