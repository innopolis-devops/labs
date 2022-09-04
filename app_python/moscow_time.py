from bottle import route, run
from datetime import datetime
from pytz import timezone


@route('/')
def hello():
    tz = timezone('Europe/Moscow')
    return 'Now in Moscow: ' + datetime.now(tz).strftime('%d-%m-%Y %H:%M:%S')


run(host='localhost', port=8080, debug=True)
