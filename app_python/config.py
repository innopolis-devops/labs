from dataclasses import dataclass


@dataclass
class Config:
    port: int


default_config = Config(port=8080)
