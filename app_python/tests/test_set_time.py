'''
Module for testing `set_time()` method of class `Time`.
When its instance is initialized, the tested method
is called. So we should just test the `time` attribute
of this class.
'''
from src.models.custom_time import Time
from freezegun import freeze_time
import pytest


@pytest.mark.parametrize('input_date,expectet_date', [
        ('2022-07-02 10:09:13', '10:09:13'),
        ('2022-09-03 11:13:17', '11:13:17')
    ])
def test_set_date(input_date, expectet_date):
    with freeze_time(input_date, tz_offset=-3):
        time_app = Time(timezone_str='Europe/Moscow')
        _time = time_app.time
    assert _time == expectet_date