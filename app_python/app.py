
"""
Author: Timur Nugaev, BS19-SD01
This module is the main module of the server
It is responsible for setting up and initialization of the whole thing
Second responsibility is to provide routes (I will separate it when I find out how)
"""

from flask import Flask, render_template
import yaml

from business_logic.time_logic import get_time

app = Flask(__name__, static_folder='static')
app.config["JSON_AS_ASCII"] = False


@app.route('/')
def get_home_page():
    """
    endpoint that returns a rendered html template with
    dynamic data (time) in the timezone of Moscow.
    :return: rendered template for home page
    """
    return render_template('index.html', time_msk=get_time("Europe/Moscow"))


if __name__ == '__main__':
    with open("config.yml", "r", encoding="utf-8") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    HOST = config["flask"]["host"]
    PORT = config["flask"]["port"]  # pylint: disable=invalid-name