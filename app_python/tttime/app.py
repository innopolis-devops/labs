import os
from flask import Flask
from flask import render_template
from datetime import datetime
from pytz import timezone
from prometheus_flask_exporter import PrometheusMetrics
from visit_tracker import VisitTracker


def make_app():
    """
    Creates an instance of the Flask application.
    """
    app = Flask(__name__, template_folder="../templates")
    metrics = PrometheusMetrics(app)
    visit_tracker = VisitTracker(filename='data/visits.json')

    @app.route('/', methods=['GET'])
    def index():
        visit_tracker.increase_number_of_visits()
        zone = timezone('Europe/Moscow')
        time = datetime.now(zone).strftime('%H:%M')
        return render_template('main.html', time=time)

    @app.route('/visits', methods=['GET'])
    def visits():
        return render_template('visits.html', visits=visit_tracker.get_visits_as_json())

    return app


app = make_app()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
