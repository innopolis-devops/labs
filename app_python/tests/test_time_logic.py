"""
This suite tests the accessibility & validity for all the endpoints on the server
"""

import pytest
from datetime import datetime
import pytz

from business_logic.time_logic import get_time


def test_get_time_moscow():
    """
    this test ensures that the logic gives
    the same result as the correct logic implementation from the first commit
    in other words, it ensures that the result is the same as the correct one
    we probably only need this test to ensure the format of the date and time doesn't change over time
    """
    zone = "Europe/Moscow"

    time_zone = pytz.timezone(zone)
    current_date_and_time = datetime.now(time_zone)
    correct_result = current_date_and_time.strftime("%H:%M:%S")

    result = get_time(zone)

    assert result == correct_result


def test_get_time_chicago():
    """
    this test ensures that the get time feature also works for Chicago time
    we'll need this when will be adding Chicago on the next iteration, post-mvp
    (let's assume these are business requirements for our project 🙌🏻)
    """
    zone = "America/Chicago"

    time_zone = pytz.timezone(zone)
    current_date_and_time = datetime.now(time_zone)
    correct_result = current_date_and_time.strftime("%H:%M:%S")

    result = get_time(zone)

    assert result == correct_result
