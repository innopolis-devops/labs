import os
import json

class WrongFormat(Exception):
    pass

class Store:
    def __init__(self):
        if not os.path.exists("/storage/visits.json"):
            with open("/storage/visits.json", "x") as file:
                file.write(json.dumps({"visits": []}))

    def get_visits(self):
        content = ""
        with open("/storage/visits.json", "r") as file:
            content = file.read()
        try:
            visits = json.loads(content)
            if "visits" in visits:
                return visits["visits"]
            raise WrongFormat()
        except (json.JSONDecodeError, WrongFormat):
            with open("/storage/visits.json", "w") as file:
                file.write(json.dumps({"visits": []}))
            return []

    def add_visit(self, visit):
        content = ""
        new_visits = []
        with open("/storage/visits.json", "r") as file:
            content = file.read()
        try:
            visits = json.loads(content)
            print(visits)
            if "visits" in visits:
                if not visits["visits"]:
                    raise WrongFormat()
                new_visits = visits["visits"]
                new_visits.append(visit)
            else:
                raise WrongFormat()
        except (json.JSONDecodeError, WrongFormat):
            new_visits = [visit]

        with open("/storage/visits.json", "w") as file:
            file.write(json.dumps({"visits": new_visits}))
