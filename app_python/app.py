from flask import Flask
from datetime import datetime
import pytz

TIMEZONE = "Europe/Moscow"
TIME_FORMAT = "%d.%m.%Y %H:%M:%S"

app = Flask(__name__)


@app.route("/")
def show_time():
    moscow_time = datetime.now(pytz.timezone(TIMEZONE)).strftime(TIME_FORMAT)
    html = "<center>" + moscow_time + "</center>"
    return html
