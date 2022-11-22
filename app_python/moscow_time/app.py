"""Main application"""
from datetime import datetime
from flask import Flask, render_template
import os
import json

VISITS_FILE = 'saved_visits.json'

app = Flask(__name__)


@app.route('/')
def index():
    """Return inflated with current time index.html"""
    date = datetime.now()
    date = str(date).split(' ')
    time = date[1].split(':')
    hour, minute, second = time[0], time[1], time[2].split('.')[0]
    saveVisits()
    return render_template(
        'index.html',
        hour=hour,
        minute=minute,
        second=second
    )
    
@app.route('/visits')
def visits():
    checkFile()
    file = open(VISITS_FILE, "r")
    visits = json.load(file)
    visits_list = ""
    n = 0
    for entry in visits["visitsList"]:
        if len(visits_list) == 0:
            visits_list += (str(entry))
        else:
            visits_list += (', ' + str(entry))
        n += 1
    return render_template(
        'visits.html',
        visits = visits_list,
        number = n
    )


def saveVisits():
    checkFile()
    current_visits_file = {}
    file_read = open(VISITS_FILE, "r")
    current_visits_file = json.load(file_read)
    current_visits_file["visitsList"].append(str(datetime.now()))

    file_write = open(VISITS_FILE, "w")
    json.dump(current_visits_file, file_write)

def checkFile():
    if not os.path.exists(VISITS_FILE):
        print("File does not exists")
        file = os.open(VISITS_FILE, os.O_CREAT)
        os.close(file)

        file_write = open(VISITS_FILE, "w")
        visitsMap = {"visitsList": []}
        json.dump(visitsMap, file_write)
