from datetime import datetime
import pytz
from controllers.time_controller import moscow_time


def test_dateformat():
    time_now = datetime.now(pytz.timezone('Europe/Moscow'))
    assert moscow_time() == time_now.strftime("%d/%m/%Y %H:%M:%S")
