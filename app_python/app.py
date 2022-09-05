from datetime import datetime
from flask import Flask
from waitress import serve

import pytz

app = Flask(__name__)


@app.route('/')
def index():
    """This is the entry point for specified root"""
    timezone = pytz.timezone("Europe/Moscow")
    now = datetime.now(timezone).strftime("%H:%M:%S - %d/%m/%Y")
    return f'<h1>{str(now)}</h1>'


if __name__ == '__main__':
    serve(app, host="0.0.0.0", port=8080)
