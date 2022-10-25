from flask import Flask
from flask import render_template
from datetime import datetime
from pytz import timezone
from prometheus_flask_exporter import PrometheusMetrics


def make_app():
    """
    Creates an instance of the Flask application.
    """
    app = Flask(__name__, template_folder="../templates")
    metrics = PrometheusMetrics(app)

    @app.route('/', methods=['GET'])
    def index():
        zone = timezone('Europe/Moscow')
        time = datetime.now(zone).strftime('%H:%M')
        return render_template('main.html', time=time)

    return app


app = make_app()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
