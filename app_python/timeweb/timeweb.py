#!/usr/bin/env python3
"""This web app shows Moscow time"""
from datetime import datetime
import pytz
from flask import Flask

UTC = pytz.utc
timez_msk = pytz.timezone('Europe/Moscow')

app = Flask(__name__)

@app.route('/')
def index():
    """
    This function handles requests to the root
    of the web server.

    Returns: string with current Moscow time
    """
    current_time = datetime.now(timez_msk)
    current_time = current_time.strftime('%H:%M:%S')
    return f'Hello! Current time in Moscow is: {current_time}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=50000)
