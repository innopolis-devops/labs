from flask import Flask
from datetime import datetime

app = Flask(__name__)


@app.route('/')
def hello_world():  # put application's code here
    now = datetime.now()

    current_time = now.strftime("%H:%M:%S")

    return current_time


if __name__ == '__main__':
    app.run()
