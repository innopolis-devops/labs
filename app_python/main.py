from datetime import datetime

from flask import Flask

app = Flask(__name__)

def get_current_time():
    now = datetime.now()
    current_time = now.strftime("Current Time in Moscow: %Y-%m-%d %H:%M:%S")
    return current_time

@app.route('/')
def home():
    return get_current_time()

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)