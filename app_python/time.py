from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def time():
    now = datetime.now()
    return "Current time is: " + now.strftime("%H:%M:%S")

if __name__ == '__main__':
    app.run()