from flask import Flask
from datetime import datetime
import pytz

app = Flask(__name__)


@app.route("/")
def index():
    timezone = pytz.timezone('Europe/Moscow')
    time = datetime.now(timezone).strftime("%Y-%m-%d %H:%M:%S")
    return str(time)


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080, debug=True)
