from flask import Flask
from datetime import datetime
from pytz import timezone
import os

app = Flask(__name__)

tz = timezone('Europe/Moscow')

@app.route('/')
def hello():
    return 'Now in Moscow: ' + datetime.now(tz).strftime('%d-%m-%Y %H:%M:%S')


@app.route('/visits')
def get_visits():
    if not os.path.isfile("visits_count"):
        file = open("visits_count", "rw")
        file.write("")
        file.close()
    file = open("visits.data", "r")
    visits = str(file.read())
    file.close()
    return visits

def add_viist():
    visits = get_visits()
    file = open("visits.data", "r")
    visits += datetime.now(tz).strftime('%d-%m-%Y %H:%M:%S') + '\n'
    file.write(str(visits))
    file.close()
    