from flask import Flask

from .controllers import time_controller

app = Flask(__name__)


@app.get('/time/moscow')
def get_moscow_time():
    return {'time': time_controller.get_moscow_time()}


@app.get('/')
def add_visit():
    with open('visits.txt', 'a') as f:
        f.write(time_controller.get_moscow_time() + '\n')

@app.get('/visits')
def get_visits():
    with open('visits.txt', 'r') as f:
        data = f.read()
    
    visit_times = data.split('\n')

    return { 'visits': visit_times }

if __name__ == '__main__':
    app.run()
