from flask import Flask
from datetime import datetime
from pytz import timezone

app = Flask(__name__)


@app.route('/')
def time():
    current_time = datetime.now(timezone('Europe/Moscow')).strftime('%H:%M:%S')
    return current_time


if __name__ == '__main__':
    app.run(host="0.0.0.0")
