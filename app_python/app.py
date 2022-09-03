from datetime import datetime
from flask import Flask
from pytz import timezone

app = Flask(__name__)


@app.route("/")
def main():
    tz_mo = timezone('Europe/Moscow')
    datetime_mo = datetime.now(tz_mo)
    return "Moscow time: " + str(datetime_mo.strftime("%H:%M:%S"))


if __name__ == '__main__':
    app.run()
