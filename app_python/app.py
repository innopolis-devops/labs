from flask import Flask
from datetime import datetime
from pytz import timezone

app = Flask(__name__)

@app.route("/")
def hello_world():
    moscow_dt = datetime.now(timezone("Europe/Moscow"))
    out_string = "Moscow time: " + moscow_dt.strftime("%H:%M:%S")
    return "<h1>" + out_string + "</h1>"