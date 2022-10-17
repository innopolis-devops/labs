from flask import Flask

from .controllers import time_controller

app = Flask(__name__)


@app.get('/time/moscow')
def get_moscow_time():
    return {'time': time_controller.get_moscow_time()}


if __name__ == '__main__':
    app.run()
