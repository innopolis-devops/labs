import datetime
import pytz
import logging
import pytest

from app.services import TimeService

logging.basicConfig(level=logging.DEBUG)

timezone = pytz.timezone("Europe/Moscow")


@pytest.mark.asyncio
async def test_time_offsets():
    for offset in [0, 3.14]:
        service = TimeService(offset, logger=logging.getLogger())
        delta = datetime.timedelta(seconds=offset)
        real_time = await service.get_real_time()
        system_time = datetime.datetime.now(timezone)
        assert delta == system_time - real_time, "Time difference does not match"
