import pytz
from flask import Flask
from datetime import datetime

app = Flask(__name__)


@app.route('/')
def show_time():
    return datetime.now(pytz.timezone("Europe/Moscow")).strftime("%H:%M:%S")


if __name__ == '__main__':
    app.run()