import pytz

from flask import Flask, render_template, jsonify
from datetime import datetime


app = Flask(__name__)

# get the time
def get_moscow_time():
    time_zone = pytz.timezone("Europe/Moscow")
    moscow_time = datetime.now(time_zone)
    return moscow_time

FILE_NAME = "/home/app/visits.json"

@app.route("/")
def index():
    visits = 0
    if os.path.exists(FILE_NAME):
        with open(FILE_NAME, "r") as f:
            visits = json.load(f)
    with open(FILE_NAME, "w") as f:
        json.dump(visits + 1, f)
        
    app.logger.warning("It is a test warning!")
    time = "Hello world! Time is:" + get_moscow_time().strftime("%H:%M:%S")
    return render_template("template.html", time=time)

@app.route("/visits")
def visit():
    """Sends back the total number of visits to the root endpoint."""
    visits = 0
    if os.path.exists(FILE_NAME):
        with open(FILE_NAME, "r") as f:
            visits = json.load(f)
    return jsonify(visits)



if __name__ == "__main__":
    app.run("localhost", 8000)
