import pytz

from datetime import datetime
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def moscow_time():
    t_zone = pytz.timezone('Europe/Moscow')
    time_now = datetime.now(t_zone)  # current date and time in timezone = t_zone
    formatted_time = time_now.strftime("%H:%M:%S")
    return render_template("moscow_timezone.html", time=formatted_time)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
