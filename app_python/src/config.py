import dataclasses
from dataclasses_json import dataclass_json


@dataclass_json
@dataclasses.dataclass
class Config:
    visits_file_path: str = "./visits.json"

    @classmethod
    def from_file(cls, config_path: str) -> "Config":
        with open(config_path) as f:
            return cls.from_json(f.read())
