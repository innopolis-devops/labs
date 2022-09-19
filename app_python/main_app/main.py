from flask import Flask
import datetime

app = Flask(__name__)

@app.route("/")
def hello_world():
    moscow_time_offset = datetime.timezone(datetime.timedelta(hours=3))
    now = datetime.datetime.now(moscow_time_offset)
    return "<h1>{0} : {1} : {2}</h1>".format(now.hour, now.minute, now.second)

if __name__ == '__main__':
    app.run()