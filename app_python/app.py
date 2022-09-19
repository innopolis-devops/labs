from flask import Flask, render_template
from datetime import datetime
import pytz


def create_app():
    app = Flask(__name__)

    @app.route('/')
    def get_moscow_time() -> str:
        time = datetime.now(pytz.timezone("Europe/Moscow")).strftime("%H:%M:%S")
        return render_template("time.html", time=time)

    return app