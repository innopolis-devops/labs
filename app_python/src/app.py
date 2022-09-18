from datetime import datetime
from flask import Flask
import pytz
import os

app = Flask(__name__)


@app.route('/')
def getMoscowTime():

    tz = pytz.timezone('Europe/Moscow')
    moscow_time = datetime.now(tz)
    return "Moscow time - " + moscow_time.strftime("%m/%d/%Y, %H:%M:%S")


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5011))
    app.run(debug=True, host='0.0.0.0', port=port)
