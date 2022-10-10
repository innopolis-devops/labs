from flask import Flask, Blueprint
from datetime import datetime
from zoneinfo import ZoneInfo
from sys import version_info
import time

# for metrics
startTime = time.time()
responses = 0

bp = Blueprint('app', __name__)

@bp.route('/')
def main():
    time_msc = datetime.now(ZoneInfo("Europe/Moscow")).time()
    global responses
    responses += 1
    return ("Moscow time: " +
        time_msc.isoformat(timespec='seconds') +
        "<br><br>(the time is actual for the last webpage load)")

@bp.route('/stats')
def stats():
    global responses, startTime
    return f"Uptime: {int(time.time() - startTime)} sec.<br>Responces send: {responses}"

def create_app(config=None):
    app = Flask(__name__)
    app.register_blueprint(bp)
    return app

if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0") if version_info >= (3, 9) else \
    print("Error: zoneinfo requires Python 3.9 or newer")