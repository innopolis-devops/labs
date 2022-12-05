import json
import os.path
from flask import jsonify


class VisitsCounter:
    def __init__(self, filename):
        self.filename = filename
        if not os.path.exists(filename):
            with open(self.filename, 'w+') as f:
                json.dump(0, f)
        else:
            need_to_erase = False
            with open(self.filename, 'r') as f:
                try:
                    json.load(f)
                except:
                    need_to_erase = True
            if need_to_erase:
                with open(self.filename, 'w') as f:
                    json.dump(0, f)

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