from flask import Flask
from datetime import datetime
import pytz

app = Flask(__name__)


@app.route('/')
def index():
    return f'{datetime.now(pytz.timezone("Europe/Moscow"))}'
