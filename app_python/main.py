from datetime import datetime
import os

from flask import Flask

app = Flask(__name__)

def get_current_time():
    now = datetime.now()
    current_time = now.strftime("Current Time in Moscow: %Y-%m-%d %H:%M:%S")
    return current_time
def log_visit():
    with open('visits.log', 'a') as f:
        f.write(f'{get_current_time()}\n')

@app.route('/')
def home():
    return get_current_time()

@app.route('/visits')
def visits():
    if os.path.exists('visits.log'):
        with open('visits.log', 'r') as f:
            return f.read()
    return "No visits yet."

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)