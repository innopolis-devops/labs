from datetime import datetime
from flask import Flask, render_template
from src import consts


def get_current_time() -> str:
    return datetime.now(consts.TIME_ZONE).strftime(consts.TIME_FORMAT)


def create_app():
    app = Flask(__name__, template_folder="../templates")

    @app.route("/")
    def index():
        time = get_current_time()
        return render_template("index.html", time=time)

    return app
