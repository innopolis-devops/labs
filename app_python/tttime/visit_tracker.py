import json
from flask import jsonify


class VisitTracker:

    def __init__(self, filename: str) -> None:
        self.filename = filename

    def increase_number_of_visits(self):
        number_of_visits = 0
        with open(self.filename, mode='r') as file:
            number_of_visits = json.load(file)
        with open(self.filename, mode='w') as file:
            json.dump(number_of_visits + 1, file)

    def get_visits_as_json(self):
        number_of_visits = 0
        with open(self.filename, mode='r') as file:
            number_of_visits = json.load(file)
        return number_of_visits
