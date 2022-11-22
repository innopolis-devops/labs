from time_utils import get_current_time, format_time
from flask import Flask
from os import linesep
from pathlib import Path

app = Flask(__name__)
visit_log_path = './visits'


@app.route('/')
def hello():
    time_now = get_current_time()
    formatted_time = format_time(time_now)

    with open(visit_log_path, "a") as visit_log:
        visit_log.write(formatted_time)
        visit_log.write(linesep)

    return formatted_time


@app.route('/visits')
def visits():
    visit_log = Path(visit_log_path)
    visit_log.touch(exist_ok=True)

    with open(visit_log_path, "r") as visit_log:
        file_content = visit_log.read()
        return "<br>".join(file_content.split('\n'))