"""Main application"""
from datetime import datetime
from flask import Flask, render_template


app = Flask(__name__)


@app.route('/')
def index():
    """Return inflated with current time index.html"""
    date = datetime.now()
    date = str(date).split(' ')
    time = date[1].split(':')
    hour, minute, second = time[0], time[1], time[2].split('.')[0]
    return render_template(
        'index.html',
        hour=hour,
        minute=minute,
        second=second
    )
    