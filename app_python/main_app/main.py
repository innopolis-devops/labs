from flask import Flask
from flask import request, current_app
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

@app.route("/")
def hello_world():
    config: Config = current_app.config["CONFIG"]

    moscow_time_offset = datetime.timezone(datetime.timedelta(hours=3))
    now = datetime.datetime.now(moscow_time_offset)

    import os
    f = os.open(config.visits_file, os.O_CREAT)
    os.close(f)

    with open(config.visits_file, "r+") as f:
        try:
            current_visits = json.load(f)
        except json.decoder.JSONDecodeError:
            current_visits = None
        f.seek(0)
        if (current_visits is None
            or "list" not in current_visits
            or "total" not in current_visits):

            current_visits = {
                "list": [],
                "total": 0
            }
        current_visits["list"].append(time_string)
        current_visits["total"] += 1
        json.dump(current_visits, f)
        f.truncate()
    
    return "<h1>{0} : {1} : {2}</h1>".format(now.hour, now.minute, now.second)


@app.route("/visits")
def list_visits():
    config: Config = current_app.config["CONFIG"]
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


if __name__ == '__main__':
    app.run()
    metrics.register_default(
        metrics.counter(
            'by_path_counter', 'Request count by request paths',
            labels={'path': lambda: request.path}
        )
    )
