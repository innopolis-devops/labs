from datetime import datetime, timezone
import pytz
from flask import Flask

app = Flask(__name__)

timezone = pytz.timezone('Europe/Moscow')
timeformat = "%H:%M:%S"

@app.route('/')
def time_page():
    return '<h2 style="text-align:center;">' + datetime.now(timezone).strftime(timeformat) + ' MSK<h2>'

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=8080, debug=True)