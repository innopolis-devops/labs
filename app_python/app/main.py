from flask import Flask
from datetime import datetime
import pytz

app = Flask(__name__)


@app.route('/')
def index():
    return f'{datetime.now(pytz.timezone("Europe/Moscow"))}'


def main():
    app.run(debug=True, port=5000, host='0.0.0.0')


if __name__ == '__main__':
    main()
