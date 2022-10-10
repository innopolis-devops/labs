from dataclasses import dataclass


@dataclass
class Config:
    port: int
    app_name: str


default_config = Config(port=8080, app_name="moscow_time_py")
