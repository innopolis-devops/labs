from flask import Flask, render_template
from datetime import datetime
import pytz


app = Flask(__name__)
current_timezone = pytz.timezone("Europe/Moscow")


@app.route('/')
def time():
    current_time = datetime.now(current_timezone).strftime("%H:%M:%S")
    return render_template("index.html", time=current_time)


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080, debug=True)