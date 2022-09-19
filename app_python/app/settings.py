from pydantic import BaseSettings
import enum


class RunEnv(str, enum.Enum):
    TEST = "test"
    DEVELOPMENT = "dev"
    PRODUCTION = "production"


class Settings(BaseSettings):
    run_env: RunEnv = RunEnv.PRODUCTION

    class Config:
        env_file = ".env"


settings = Settings()
