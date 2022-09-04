from flask import Flask
from datetime import datetime

app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello word'


if __name__ == "__main__":
    app.run(port=5001, debug=True)
