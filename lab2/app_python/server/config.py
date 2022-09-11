from pydantic import BaseSettings


class Config(BaseSettings):
    TIMEZONE: str = 'Europe/Moscow'


config = Config()
