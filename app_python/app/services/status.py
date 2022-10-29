from aioredis import Redis
import logging

from app.mocks.redis import MockRedis
from app.models import Status

uvicorn_logger = logging.getLogger("uvicorn")


class StatusService:
    __requests_db_key = "requests"

    def __init__(
        self,
        db: Redis | MockRedis = MockRedis(),
        logger: logging.Logger = uvicorn_logger,
    ):
        self.db: Redis = db
        logger.info(f"StatusService initialized")

    async def log_request(self) -> None:
        await self.db.incr(self.__requests_db_key)

    async def get_status(self) -> Status:
        request_count = await self.db.get(self.__requests_db_key)
        return Status(requests_served=0 if request_count is None else request_count)
