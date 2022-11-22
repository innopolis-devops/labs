from flask import Flask, request
import requests
import datetime
from prometheus_flask_exporter import PrometheusMetrics
import json
import pprint

class Config:
    visits_file = "persistent/visits.json"


config = Config()
try:
    with open("config.json", "r") as conf_file:
        print("Reading config file")
        config_json = json.load(conf_file)
    expected_fields = [a for a in dir(config) if not a.startswith('__') and not callable(getattr(config, a))]
    for f in expected_fields:
        if f in config_json:
            setattr(config, f, config_json[f])
except FileNotFoundError:
    print("Config not found, using default")

app = Flask(__name__)
app.config["CONFIG"] = config
metrics = PrometheusMetrics(app)

@app.route('/')
def index():
    offset = datetime.timezone(datetime.timedelta(hours=3))
    now_time = datetime.datetime.now(offset)
    time = f"{now_time.hour}:{now_time.minute}:{now_time.second}"
    save_data_to_json(time)
    return "<h1>Current Moscow time: " + time + "</h1>"

def save_data_to_json(data_string):
    config: Config = app.config["CONFIG"]
    # Create file if does not exist
    import os
    cur_path = os.path.dirname(__file__)
    new_path = os.path.relpath(config.visits_file, cur_path)
    if not os.path.exists(config.visits_file):
        with open(new_path, 'w'):
            pass
    # Save page visit to file
    with open(new_path, "r+") as f:
        try:
            current_visits = json.load(f)
        except json.decoder.JSONDecodeError:
            current_visits = None
        f.seek(0)
        if (current_visits is None
                or "list" not in current_visits
                or "total" not in current_visits):
            # Initialize visits file contents
            current_visits = {
                "list": [],
                "total": 0
            }
        current_visits["list"].append(data_string)
        current_visits["total"] += 1
        json.dump(current_visits, f)
        f.truncate()


@app.route("/visits")
def list_visits():
    config: Config = app.config["CONFIG"]
    try:
        with open(config.visits_file, "r") as f:
            v = json.load(f)
            result = "Total visits: " + str(v["total"]) + "<br>"
            result += "Entries:<br>"
            for entry in v["list"]:
                result += str(entry) + "<br>"
            return result
    except (FileNotFoundError, json.decoder.JSONDecodeError):
        return "No visits to \"/\" detected"

if __name__ == "__main__":
    app.run()
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )