import datetime

import pytz
from flask import Flask, request

app = Flask(__name__)


@app.route("/")
def moscow_time():
    dttm = datetime.datetime.now(pytz.timezone("Europe/Moscow"))
    time = f"{dttm.hour}:{dttm.minute}:{dttm.second}"
    with open("/home/app/visits/visits.txt", "a+") as f:
        f.write(f"{dttm.isoformat(timespec='seconds')} - {request.remote_addr}\n")
    return f"<h2>Moscow time: {time}</h2>"


@app.route('/visits')
def visits():
    web_content = "History:\n"
    try:
        with open("/home/app/data/visits.txt", "r") as fo:
            file_text = fo.read()
            web_content += f"{file_text}"
    except FileNotFoundError:
        pass

    return web_content
