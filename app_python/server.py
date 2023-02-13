"""modules for timezone, datetime and flask framework"""
from datetime import datetime
from flask import Flask
import pytz

app = Flask(__name__)

@app.route('/')
def index():
    """function to configure the timezone and get current time from it"""
    time_zone = pytz.timezone('Europe/Moscow')
    date_time = datetime.now(time_zone)
    return "Current time in Moscow is : " + date_time.strftime("%H:%M:%S")


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080, debug=True)

# SOURCES USED:
# https://realpython.com/python-web-applications/
# https://www.stackvidhya.com/how-to-get-current-time-in-python/
