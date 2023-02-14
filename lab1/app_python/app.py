from datetime import datetime
from pytz import timezone
from flask import render_template_string

from flask import Flask

app = Flask(__name__)

PAGE_SOURCE = '''
<!DOCTYPE html>
<html>
<head>
    <title>Lab 1</title>
</head>
<body>
    <h1>Current time: {{ time }}</h1>
</body>
</html>
'''


@app.route('/')
def show_time():
    tm = datetime.now()
    # convert to moscow
    tm = tm.astimezone(timezone('Europe/Moscow'))
    return render_template_string(PAGE_SOURCE, time=tm.strftime('%H:%M:%S'))


if __name__ == '__main__':
    app.run(debug=False)
