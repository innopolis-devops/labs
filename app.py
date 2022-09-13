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


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
