from flask import Flask
from datetime import datetime
from pytz import timezone

app = Flask(__name__)


@app.route('/')
def hello():
    tz = timezone('Europe/Moscow')
    return 'Now in Moscow: ' + datetime.now(tz).strftime('%d-%m-%Y %H:%M:%S')
