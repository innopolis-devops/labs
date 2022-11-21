#!/usr/bin/env python3
"""This web app shows Moscow time"""
from datetime import datetime
import pytz
import sqlite3
import json
from flask import Flask

UTC = pytz.utc
timez_msk = pytz.timezone('Europe/Moscow')

app = Flask(__name__)

con = sqlite3.connect("/data/visits.db")
cur = con.cursor()
cur.execute('CREATE TABLE IF NOT EXISTS visits (visit_time TEXT)')
con.commit()
cur.close()

@app.route('/visits')
def visits():
    cur = con.cursor()
    data = cur.execute('SELECT * FROM visits')
    output = []
    for d in data.fetchall():
        output.append(d[0])
    cur.close()
    return json.dumps(output)


@app.route('/')
def index():
    """
    This function handles requests to the root
    of the web server.

    Returns: string with current Moscow time
    """
    current_time = datetime.now(timez_msk)
    current_time = current_time.strftime('%H:%M:%S')
    cur = con.cursor()
    cur.execute(f'INSERT INTO visits (visit_time) VALUES (\'{current_time}\')')
    con.commit()
    cur.close()
    return f'Hello! Current time in Moscow is: {current_time}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=50000)
