from src.app import get_current_time
from freezegun import freeze_time
import pytest


@pytest.mark.parametrize(
    "current_time,expected_output",
    [
        ("2021-01-14 12:00:01", "12:00:01"),
        ("2022-09-17 10:58:22", "10:58:22"),
    ],
)
def test_get_current_time(current_time: str, expected_output: str):
    with freeze_time(current_time, tz_offset=-3):
        output = get_current_time()

    assert output == expected_output
