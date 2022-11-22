from flask import request, Flask
from datetime import datetime
import pytz
import markdown
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)
visits_path = './time_visit.txt'

def writeVisit(date):
    with open(visits_path, 'a') as visitsFile:
        visitsFile.write(f"{str(date)}\n")

@app.route('/')
def time():
    moscowTimeZone = pytz.timezone('Europe/Moscow')
    currentDateInMoscow = datetime.now(moscowTimeZone)
    formatedDate = currentDateInMoscow.strftime('%d-%m-%Y %H:%M:%S')
    writeVisit(formatedDate)
    return markdown.markdown(formatedDate)

@app.route('/visits')
def visits():
    visitsList = []
    with open(visits_path, 'r') as visitsFile:
        lines = visitsFile.readlines()
        for line in lines:
            visitsList.append(line[:-2])
    return visitsList

if __name__ == "__main__":
    app.run()
    metrics.register_default(
    metrics.counter(
        'by_path_counter', 'Request count by request paths',
        labels={'path': lambda: request.path}
    )
)

