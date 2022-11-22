'''
Module providing function that renders the time web page.
'''
from flask import Flask, render_template, jsonify
from src.models.custom_time import Time
from prometheus_flask_exporter import PrometheusMetrics
import os

os.makedirs('volume', exist_ok=True)
visits_file = 'volume/visits.txt'

def create_app():
    '''
    Function that creates instance of Flask
    '''
    app = Flask('Time', template_folder='../templates')
    metrics = PrometheusMetrics(app)
    
    app.static_folder = '../static'
    @app.route("/")
    def get_cur_time():
        '''
        Function that renders the time web page.
        '''
        time_app = Time(timezone_str='Europe/Moscow')
        _date=time_app.date
        _time=time_app.time

        with open(visits_file, 'a') as file:
            file.write(_date + ' ' + _time + '\n')
        
        return render_template('clock.html', date=_date, time=_time)

    @app.route("/health")
    def health():
        return "200"

    @app.route("/visits")
    def visits():

        with open(visits_file, 'r') as file:
            visits = file.read()
    
        return visits

    return app
