from datetime import datetime
from flask import Flask, render_template
import consts

app = Flask(__name__)


def get_current_time() -> str:
    return datetime.now(consts.TIME_ZONE).strftime(consts.TIME_FORMAT)


@app.route("/")
def index():
    time = get_current_time()
    return render_template("index.html", time=time)
