from datetime import datetime

import pytz
from flask import Flask
from jinja2 import Environment, PackageLoader, select_autoescape

env = Environment(
    loader=PackageLoader("app"),
    autoescape=select_autoescape()
)
app = Flask(__name__)


def get_current_moscow_time() -> str:
    return datetime.now(pytz.timezone('Europe/Moscow')).strftime("%H:%M:%S")


@app.route("/")
def main_page():
    template = env.get_template("main_page.html.jinja")
    return template.render(time=get_current_moscow_time())
