import json
from flask import jsonify


class VisitsCounter:
    def __init__(self, filename):
        self.filename = filename

    def count(self):
        visits = 0
        with open(self.filename, 'r') as f:
            visits = json.load(f)
        with open(self.filename, 'w') as f:
            json.dump(visits + 1, f)
    
    def get_json(self):
        visits = 0
        with open(self.filename, 'r') as f:
            visits = json.load(f)
        return jsonify(visits)