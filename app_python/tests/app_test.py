import pytest
import time
from dateutil.parser import parse
from datetime import datetime
from app_python.app import get_time

testdata_format = [
    ('Europe/Moscow', '%Y-%m-%d %H:%M:%S.%f %z'),
    ('Europe/London', '%Y-%m-%d %H:%M:%S'),
    ('America/New_York', '%d.%m.%Y %H:%M:%S.%f')
]

testdata_update = [
    ('Europe/Moscow', '%Y-%m-%d %H:%M:%S.%f %z', 3),
    ('Europe/London', '%Y-%m-%d %H:%M:%S', 5),
    ('America/New_York', '%d.%m.%Y %H:%M:%S.%f', 10)
]


@pytest.mark.parametrize("tz, tf", testdata_format)
def test_time_format(tz, tf):
    """
    GIVEN timezone and time format
    WHEN current time is returned
    THEN check time format is generated correctly
    """
    time_string = get_time(tz, tf)
    assert datetime.strptime(time_string, tf)


@pytest.mark.parametrize("tz, tf, sec", testdata_update)
def test_time_update(tz, tf, sec):
    """
    GIVEN current time
    WHEN returns current time after some seconds
    THEN check delta time
    """
    curr_time = parse(get_time(tz, tf))
    time.sleep(sec)
    curr_time_new = parse(get_time(tz, tf))
    delta = int((curr_time_new - curr_time).total_seconds())
    assert delta == sec
