import dataclasses
from dataclasses_json import dataclass_json
import typing
from src.config import Config
from pathlib import Path


@dataclass_json
@dataclasses.dataclass
class Visits:
    visits: typing.List[str] = dataclasses.field(default_factory=list)

    @classmethod
    def from_file(cls, path: str) -> "Visits":
        if not Path(path).exists():
            return cls()

        with open(path, "r") as f:
            return cls.from_json(f.read() or "{}")

    def write(self, path: str):
        with open(path, "w+") as f:
            f.write(self.to_json())


def add_entry(config: Config, time):
    v = Visits.from_file(config.visits_file_path)
    v.visits.append(time)
    v.write(config.visits_file_path)
