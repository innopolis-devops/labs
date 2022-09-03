"""This module provides handler for moscow time requests"""
from datetime import datetime

import pytz
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def moscow_time():
    """Handler for moscow time requests"""
    tz = pytz.timezone('Europe/Moscow')
    now = datetime.now(tz)  # current date and time
    time = now.strftime("%H:%M:%S")

    return render_template("moscow-time.html", time=time)


if __name__ == '__main__':
    app.run()
