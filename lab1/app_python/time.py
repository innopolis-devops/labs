#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from datetime import datetime
from flask import Flask

app = Flask(__name__)

@app.route("/")
def now():
    return str(datetime.now())

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
