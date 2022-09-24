from flask import Flask, Blueprint
from datetime import datetime
from zoneinfo import ZoneInfo
from sys import version_info

bp = Blueprint('app', __name__)

@bp.route('/')
def main():
    time_msc = datetime.now(ZoneInfo("Europe/Moscow")).time()
    return ("Moscow time: " +
        time_msc.isoformat(timespec='seconds') +
        "<br><br>(the time is actual for the last webpage load)")

def create_app(config=None):
    app = Flask(__name__)
    app.register_blueprint(bp)
    return app

if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0") if version_info >= (3, 9) else \
    print("Error: zoneinfo requires Python 3.9 or newer")