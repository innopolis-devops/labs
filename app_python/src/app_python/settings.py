from typing import Optional

from pydantic import Field, BaseSettings


class _Settings(BaseSettings):
    root_path: Optional[str] = Field(default=None, title='Root path of the api.')

    class Config:
        case_sensitive = False

        env_file = '.env'
        env_prefix = 'APP_API_'


settings = _Settings()
