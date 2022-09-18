import pytz
import pytest
from datetime import datetime

from controllers import time_controller
from utils.consts import DATE_TIME_FORMAT


def test_get_moscow_time_format():
    result = time_controller.get_moscow_time()

    parsed_result_date = datetime.strptime(result, DATE_TIME_FORMAT)
    assert type(parsed_result_date) == datetime


def test_get_moscow_time_correct_time():
    result = time_controller.get_moscow_time()
    parsed_result_date = datetime.strptime(result, DATE_TIME_FORMAT)

    timezone = pytz.timezone('Europe/Moscow')
    reference_time = datetime.now(timezone)

    assert parsed_result_date.year == reference_time.year
    assert parsed_result_date.month == reference_time.month
    assert parsed_result_date.day == reference_time.day
    assert parsed_result_date.hour == reference_time.hour
    assert parsed_result_date.minute == reference_time.minute
