import json
from dataclasses import dataclass


@dataclass
class Config:
    port: int
    app_name: str
    visits_file: str


_default_config_data = {
    "port": 8080,
    "app_name": "app_python",
    "visits_file": "data/visits.txt",
}

try:
    with open("/app/config.json", "r") as f:
        data = json.load(f)
        _default_config_data.update(data)
except FileNotFoundError:
    pass

default_config = Config(**_default_config_data)  # type: ignore
