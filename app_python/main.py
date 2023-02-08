from flask import Flask

import time_utils

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
    """.format(time_utils.get_time_in_moscow())
