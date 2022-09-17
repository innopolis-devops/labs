import datetime
from typing import List
from pytest_mock import MockerFixture
import pytest
import time
import pytz
from superclock.timezone_clock import TimezoneClock


@pytest.mark.parametrize("tz_name", ["America/Phoenix", "Europe/Belfast", "Europe/Moscow", "Asia/Tomsk"])
def test_get_utc(tz_name: str) -> None:
    clock = TimezoneClock(tz_name)
    assert abs(clock.get_utc().timestamp() - time.time()) < 1e-3


@pytest.mark.parametrize("tz_name", [("America/Phoenix"), ("Europe/Belfast"), ("Europe/Moscow"), ("Asia/Tomsk")])
def test_get_datetime(tz_name: str) -> None:
    clock = TimezoneClock(tz_name)
    tz_time = clock.get_datetime()
    delta = tz_time.replace(tzinfo=datetime.timezone.utc).timestamp() - tz_time.timestamp()
    target_delta = pytz.timezone(tz_name).utcoffset(tz_time.replace(tzinfo=None))
    assert round(delta) == target_delta.total_seconds()


@pytest.mark.parametrize("cur_time,target_str", [
    (datetime.datetime(2022, 9, 18, 11, 23, 56), "11:23:56"),
    (datetime.datetime(2022, 9, 18, 5, 23, 56), "05:23:56"),
    (datetime.datetime(2022, 9, 18, 5, 3, 2), "05:03:02"),
    (datetime.datetime(2022, 9, 18, 0, 0, 0), "00:00:00"),
    (datetime.datetime(2022, 9, 18, 23, 59, 59), "23:59:59"),
    ])
def get_time_str(mocker: MockerFixture, cur_time: datetime.datetime, target_str: str) -> None:
    clock = TimezoneClock("Europe/Moscow")
    mocker.patch.object(clock, 'get_datetime', lambda *args: cur_time)
    assert clock.get_time_str() == target_str
