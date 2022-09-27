from flask import Flask
from datetime import datetime
from pytz import timezone

app = Flask(__name__)


@app.route('/')
def index():
    zone = timezone('Europe/Moscow')
    return f'The current time in Moscow is: {datetime.now(zone).ctime()}'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
