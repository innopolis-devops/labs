from app.lib.time import TimeFormatter
from datetime import datetime
import pytest


@pytest.mark.parametrize(
    'utc_date,time_zone,expected_string',
    [
        ('2022-11-04 12:05:23.283+00:00', 'Europe/Moscow', '15:05:23'),
        ('2022-11-04 12:05:23.283+00:00', 'America/Los_Angeles', '05:05:23')
    ]
)
def test_time_formatter(utc_date, time_zone, expected_string):
    formatter = TimeFormatter(time_zone)
    formatter.format = '%H:%M:%S'

    date_object = datetime.fromisoformat(utc_date)
    date_string = formatter.get_string(date_object)

    assert date_string == expected_string
