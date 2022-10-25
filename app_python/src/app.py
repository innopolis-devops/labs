'''
Module providing function that renders the time web page.
'''
from flask import Flask, render_template, jsonify
from src.models.custom_time import Time
from prometheus_flask_exporter import PrometheusMetrics


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
        return render_template('clock.html', date=time_app.date, time=time_app.time)

    @app.route("/health")
    def health():
        return "200"

    return app
