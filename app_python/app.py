# import
from datetime import datetime
from flask import Flask
import requests
import os

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
        with open('./visit.txt', 'a+') as file:
            file.write(current_time.strftime("%m/%d/%Y, %H:%M:%S") + '\n')
        return f"Date and time: {current_time}"  # return current date and time

@app.route('/visits')
def visits():
    with open('./visit.txt', 'r') as file:
        visits = file.read()
    return visits

if __name__ == "__main__":
    app.run()
