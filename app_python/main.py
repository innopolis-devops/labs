from flask import request, Flask
from datetime import datetime
import pytz
import markdown
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/')
def time():
    moscowTimeZone = pytz.timezone('Europe/Moscow')
    currentDateInMoscow = datetime.now(moscowTimeZone)
    formatedDate = currentDateInMoscow.strftime('%d-%m-%Y %H:%M:%S')
    return markdown.markdown(formatedDate)

if __name__ == "__main__":
    app.run()
    metrics.register_default(
    metrics.counter(
        'by_path_counter', 'Request count by request paths',
        labels={'path': lambda: request.path}
    )
)

