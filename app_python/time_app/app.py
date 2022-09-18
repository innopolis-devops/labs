"""This module provides a flask web server that shows current time in Moscow (MSK)"""

from datetime import datetime
import datetime as dt
from flask import Flask, render_template

app = Flask(__name__)

offset = dt.timedelta(hours=3)
tz = dt.timezone(offset, name="MSK")

@app.route('/')
def show_time():
    """show time on GET /

    Returns:
        str: HTML page
    """
    return render_template('index.html', datetime = str(datetime.now(tz=tz).strftime("%H:%M:%S")))
