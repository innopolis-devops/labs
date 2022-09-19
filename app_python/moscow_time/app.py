"""Main application"""
from datetime import datetime, timezone, timedelta
from flask import Flask, render_template


app = Flask(__name__)

year = 0
month = 0
day = 0
hour = 0
minute = 0
second = 0

@app.route('/')
def index():
    """Return inflated with current time index.html"""
    global year, month, day, hour, minute, second
    offset = timedelta(hours=3) 
    tz = timezone(offset= offset)
    date = datetime.now(tz)
    date = str(date).split(' ')
    time = date[1].split(':')
    year, month, day = date[0].split('-')
    hour, minute, second = time[0], time[1], time[2].split('.')[0]
    return render_template(
        'index.html',
        hour=hour,
        minute=minute,
        second=second
    )
    