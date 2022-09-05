from flask import Flask
import datetime

app = Flask(__name__)


@app.route('/')
def show_time():
    moscow_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return moscow_time


if __name__ == '__main__':
    app.run()
