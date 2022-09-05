import pytz
from datetime import datetime

from flask import Flask

app = Flask(__name__)


@app.get('/time/moscow')
def get_moscow_time():
    timezone = pytz.timezone('Europe/Moscow')
    time = datetime.now(timezone)
    formatted_time = time.strftime('%Y-%m-%dT%H:%M:%S')

    return {'time': formatted_time}


if __name__ == '__main__':
    app.run()