import pytz
from datetime import datetime, timezone
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    tz_msk = pytz.timezone('Europe/Moscow')
    current_time = str(datetime.now(tz_msk))
    return current_time