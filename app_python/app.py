"""
Simple Flask app for showing time in Moscow
"""
from datetime import datetime, timedelta, timezone
from flask import Flask, render_template

app = Flask(__name__)

offset = timedelta(hours=3)
tz = timezone(offset, name='MSK')

@app.route('/')
def display_time():
    '''
    Main function for default route.
    Places time in the template file
    '''
    return render_template('template.html', datetime = str(datetime.now(tz=tz)))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
