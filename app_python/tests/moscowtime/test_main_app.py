from datetime import datetime

import pytz

from app_python.moscowtime.main_app import moscow_time, app


def test_moscow_time():
    with app.app_context():
        t_zone = pytz.timezone('Europe/Moscow')
        time_now = datetime.now(t_zone)
        formatted_time = time_now.strftime("%H:%M:%S")
        assert moscow_time() == f'Current time in Moscow: {formatted_time}'
