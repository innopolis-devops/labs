from flask import Flask
from datetime import datetime
import pytz

LOG_FILENAME = './access.log'

app = Flask(__name__)
tz_Moscow = pytz.timezone("Europe/Moscow")


@app.route('/')
def start():
    # application code
    current_time = datetime.now(tz_Moscow).strftime("%H:%M:%S")
    with open(LOG_FILENAME, 'a') as file:
        file.write(current_time + '\n')
    return f"<center>Today in Moscow {current_time}</center>"


if __name__ == '__main__':
    app.run()

