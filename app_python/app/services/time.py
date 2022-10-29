from datetime import datetime, timedelta
import pytz as pytz
from ntplib import NTPClient
import logging

uvicorn_logger = logging.getLogger("uvicorn")


class TimeService:
    def __init__(self, offset: float, logger: logging.Logger = uvicorn_logger):
        logger.info(f"TimeService initialized with {offset=}")
        self.offset = offset

    @classmethod
    def from_ntp(cls, server: str, logger: logging.Logger = uvicorn_logger):
        logger.info(f"Trying to get NTP response from {server}")
        return cls(NTPClient().request(server).offset, logger=logger)

    @staticmethod
    async def get_system_time() -> datetime:
        return datetime.now(pytz.timezone("Europe/Moscow"))

    async def get_real_time(self) -> datetime:
        return await self.get_system_time() - timedelta(seconds=self.offset)
