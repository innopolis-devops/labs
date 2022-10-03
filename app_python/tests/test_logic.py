from datetime import datetime

import pytest
import pytz

from app_python.main import Clock, InvalidTimezoneError


def test_time_fault():
    app_moscow_clock = Clock("Europe/Moscow")
    local_moscow_clock = pytz.timezone("Europe/Moscow")

    app_moscow_time = app_moscow_clock.bring_raw_time()
    local_moscow_time = datetime.now(local_moscow_clock)

    delta = local_moscow_time - app_moscow_time
    assert delta.seconds < 1, "Infelicity increased 1 second" \
                              "probably pytz.timezone is broken"


def test_timezone_fault():
    with pytest.raises(InvalidTimezoneError):
        _ = Clock('not_existing_timezone')