import json


class Config:
    """
    Config for msctime
    """
    def __init__(self):
        try:
            with open('config.json', 'r') as f:
                print("Reading config file")
                config = json.load(f)
                self.persistent_path = config["persistent_path"]
        except (FileNotFoundError, json.JSONDecodeError):
            self.persistent_path = "persistent/visits.json"
