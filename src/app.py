'''
Module providing function that renders the time web page.
'''
from flask import Flask, render_template
from src.models.custom_time import Time


def create_app():
    app = Flask('Time', template_folder='src/templates')
    
    @app.route("/")
    def get_cur_time():
        '''
        Function that renders the time web page.
        '''
        time_app = Time(timezone_str='Europe/Moscow')
        return render_template('clock.html', date=time_app.date, time=time_app.time)


    return app
