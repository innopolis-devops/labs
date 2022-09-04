from flask import Flask, render_template
import yaml

from datetime import datetime
from utils.main import get_current_time_formatted

app = Flask(__name__)

"""
 Main entry route 
"""
@app.route("/")
def index():
    return render_template("index.html", current_time = get_current_time_formatted())

if __name__ == '__main__':
    with open("config.yml", "r", encoding="utf-8") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    HOST = config["flask"]["host"]
    PORT = config["flask"]["port"]
    app.run(HOST, PORT)