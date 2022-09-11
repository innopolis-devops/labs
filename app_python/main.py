from flask import Flask
app = Flask(__name__)

from datetime import datetime
from zoneinfo import ZoneInfo
from sys import version_info

@app.route('/')
def main():
    time_msc = datetime.now(ZoneInfo("Europe/Moscow")).time()
    return ("Moscow time: " +
        time_msc.isoformat(timespec='seconds') +
        "<br><br>(the time is actual for the last webpage load)")

if __name__ == "__main__":
    app.run(host="0.0.0.0") if version_info >= (3, 9) else \
    print("Error: zoneinfo requires Python 3.9 or newer")