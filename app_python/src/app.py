from datetime import datetime
from flask import Flask, request
import pytz
import os

app = Flask(__name__)

@app.route('/')
def getMoscowTime():

    tz = pytz.timezone('Europe/Moscow')
    dt = datetime.now(tz)
    moscow_time = datetime.now(tz)
    if not os.path.exists('/home/app/data/visits.txt'):
        print('ERROR: visits file not found')
        return "Moscow time - " + moscow_time.strftime("%m/%d/%Y, %H:%M:%S")
    with open("/home/app/data/visits.txt", "a+") as f:
        f.write(f"{dt.isoformat(timespec='seconds')} - {request.remote_addr}\n")
    return "Moscow time - " + moscow_time.strftime("%m/%d/%Y, %H:%M:%S")

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

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5011))
    app.run(debug=True, host='0.0.0.0', port=port)
