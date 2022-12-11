from flask import Flask
import os
import datetime

app = Flask(__name__)

log_filename = os.getenv("LOG_FILE_ENV", "data/visits.log")
os.makedirs(os.path.dirname(log_filename), exist_ok=True)


def save_time(current_time):
    with open(log_filename, "a+") as f:
        f.write(current_time)
        f.write("\n")


@app.route('/')
def show_time():
    moscow_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    save_time(moscow_time)
    return moscow_time


@app.route("/visits")
def get_visits():
    with open(log_filename, "r") as f:
        return "".join(f.readlines())


if __name__ == '__main__':
    app.run()
