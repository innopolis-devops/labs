from datetime import datetime
import pytz
import app
import pytest


@pytest.fixture
def get_curr_time():
    curr_time = datetime.now(tz=pytz.timezone("Europe/Moscow"))
    curr_time = curr_time.strftime("%-I:%-M:%-S")
    curr_time_html = f"<center style='font-size: 60px;'>{curr_time}</center>"
    return curr_time_html


@pytest.fixture
def get_app_time():
    return app.show_moscow_time()


def test_time_markup(get_app_time, get_curr_time):
    assert get_curr_time == get_app_time
