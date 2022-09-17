"""
Simple Flask app for showing time in Moscow
"""
from datetime import datetime, timedelta, timezone

from flask import Flask, render_template

flask_app = Flask(__name__)

offset = timedelta(hours=3)
tz = timezone(offset, name='MSK')

def get_time_str():
    '''
    Returns current time in Moscow
    '''
    return str(datetime.now(tz=tz))

@flask_app.route('/')
def display_time():
    '''
    Main function for default route.
    Places time in the template file
    '''
    return render_template('template.html', datetime = get_time_str())

if __name__ == '__main__':
    flask_app.run(debug=True, host='0.0.0.0')
