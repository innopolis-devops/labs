'''
Module providing function that renders the time web page.
'''
from flask import Flask, render_template
from models.custom_time import Time


app = Flask('Time')


@app.route("/")
def get_cur_time():
    '''
    Function that renders the time web page.
    '''
    time_app = Time(timezone_str='Europe/Moscow')
    return render_template('clock.html', date=time_app.date, time=time_app.time)


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8000, debug=True)
