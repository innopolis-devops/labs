'''
Module for testing `set_datetime()` method of class `Time`.
When its instance is initialized, the tested method
is called. So we should just test the `datetime` attribute
of this class.
'''
from src.models.custom_time import Time
from freezegun import freeze_time
import pytest


@pytest.mark.parametrize('input_date,expectet_date', [
        ('2022-07-02 10:09:13', '2022-07-02 Sat, 10:09:13'),
        ('2022-09-03 11:13:17', '2022-09-03 Sat, 11:13:17')
    ])
def test_set_date(input_date, expectet_date):
    with freeze_time(input_date, tz_offset=-3):
        time_app = Time(timezone_str='Europe/Moscow')
        _datetime = time_app.datetime.strftime('%Y-%m-%d %a, %H:%M:%S')
        print(_datetime)
    assert _datetime == expectet_date
