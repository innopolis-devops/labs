from flask import Flask, render_template
import datetime

app = Flask(__name__)


@app.route('/')
def hello_world():
    offset = datetime.timezone(datetime.timedelta(hours=3))
    moscow_time = datetime.datetime.now(offset)
    print(type(moscow_time))
    return render_template('moscow_time.html', moscow_time=moscow_time, time=moscow_time.strftime("%H:%M:%S"))


if __name__ == '__main__':
    app.run()
