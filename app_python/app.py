from time_utils import get_current_time, format_time

import pytz
from flask import Flask

app = Flask(__name__)


@app.route('/')
def home():
    current_time = get_current_time()
    return format_time(current_time)