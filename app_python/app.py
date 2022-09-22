from flask import Flask
from datetime import datetime
from zoneinfo import ZoneInfo

app = Flask(__name__)


@app.route('/')
def index():
    zone = ZoneInfo('Europe/Moscow')
    return f'{datetime.now(zone).ctime()}'


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)
