from datetime import datetime

import pytz
from flask import Flask

app = Flask(__name__)


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
