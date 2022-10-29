from pydantic import BaseSettings
import enum


class RunEnv(str, enum.Enum):
    TEST = "test"
    DEVELOPMENT = "dev"
    PRODUCTION = "production"


class Settings(BaseSettings):
    run_env: RunEnv = RunEnv.PRODUCTION
    ntp_server: str
    redis_host: str
    redis_port: int

    class Config:
        env_file = ".env"


settings = Settings()
