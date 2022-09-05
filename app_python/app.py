from datetime import datetime
from flask import Flask
import pytz


MSK = pytz.timezone('Europe/Moscow')
app = Flask(__name__)

@app.route("/GetTime")
def index():
    datetime_msk = datetime.now(MSK)
    return f"<p>{datetime_msk.strftime('%Y:%m:%d %H:%M:%S %Z %z')}</p>"
