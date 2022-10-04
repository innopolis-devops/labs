'''
Module for testing `set_date()` method of class `Time`.
When its instance is initialized, the tested method
is called. So we should just test the `date` attribute
of this class.
'''
from src.models.custom_time import Time
from freezegun import freeze_time
import pytest


@pytest.mark.parametrize('input_date,expectet_date', [
        ('2022-07-02', '2022-07-02 Sat'),
        ('2022-09-03', '2022-09-03 Sat')
    ])
def test_set_date(input_date, expectet_date):
    with freeze_time(input_date, tz_offset=-3):
        time_app = Time(timezone_str='Europe/Moscow')
        date = time_app.date
    assert date == expectet_date