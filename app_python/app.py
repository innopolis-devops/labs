from datetime import datetime
from flask import Flask
import pytz

app = Flask(__name__)


@app.route('/')
def hello():
    tz = pytz.timezone('Europe/Moscow')
    moscow_time = datetime.now(tz)
    return "Moscow time - " + moscow_time.strftime("%m/%d/%Y, %H:%M:%S")
