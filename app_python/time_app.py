from datetime import datetime

import pytz
from flask import Flask
from healthcheck import HealthCheck

app = Flask(__name__)

health = HealthCheck()

time_start = datetime.now()


@app.route('/', methods=['GET'])
def time():
    content = """
         <html>
             <head>
                 <title>Time in UTC + 3</title>
             </head>
             <body>
                 <h1>%s</h1>
             </body>
         </html>
         """
    moscow = pytz.timezone('Europe/Moscow')
    time_format = '%Y-%m-%d %H:%M:%S %Z%z'
    return content % datetime.now(moscow).strftime(time_format)


def app_available():
    return True, "Up time " + str((datetime.now() - time_start).days * 24)


health.add_check(app_available)

# Add a flask route to expose information
app.add_url_rule("/healthcheck", "healthcheck", view_func=lambda: health.run())
