from datetime import datetime, timedelta

import pytz as pytz
from fastapi import Depends
from ntplib import NTPClient

ntp_response = NTPClient().request("time.google.com")
offset = ntp_response.offset


async def get_system_time() -> datetime:
    return datetime.now(pytz.timezone("Europe/Moscow"))


async def get_real_time(system_time: datetime = Depends(get_system_time)) -> datetime:
    return system_time - timedelta(seconds=ntp_response.offset)
