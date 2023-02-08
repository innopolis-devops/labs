from flask import Flask

import time_utils

# index page callback
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

# flask server entry point
if __name__ == "__main__":
    app = Flask(__name__)
