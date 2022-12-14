# pylint: disable=missing-function-docstring
'''Render main page'''
from datetime import datetime
from flask import Flask
from flask import render_template
from pytz import timezone

app = Flask(__name__)
app.static_folder = 'static'


@app.route("/")
def render_time_page():
    return render_template(
        "time.html",
        date=datetime.now(timezone('Europe/Moscow'))
    )
@app.route("/health")
def health():
    return "200"

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8000, debug=True)
