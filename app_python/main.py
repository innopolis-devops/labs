from datetime import datetime
from flask import Flask
import pytz

app = Flask(__name__)

def get_time(timezone):
    tz = pytz.timezone(timezone)
    return datetime.now(tz).strftime("%H:%M:%S")

@app.route("/")
def default_page():
    return """
    <html>
        <head>
            <style>
                h1 {{text-align: center;}}
            </style>
        </head>
        <body>
            <h1>Current time in Moscow: {}</h1>
        </body>
    </html>
    """.format(get_time("Europe/Moscow"))
