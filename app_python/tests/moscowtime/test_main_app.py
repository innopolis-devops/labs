import unittest
from datetime import datetime
from unittest import TestCase

import pytz

from app_python.moscowtime.main_app import moscow_time, app


class Test(TestCase):
    def test_moscow_time(self):
        with app.app_context():
            t_zone = pytz.timezone('Europe/Moscow')
            time_now = datetime.now(t_zone)  # current date and time in timezone = t_zone
            formatted_time = time_now.strftime("%H:%M:%S")
            self.assertEqual(moscow_time(),
                             f'Current time in Moscow: {formatted_time}'
                             )


if __name__ == '__main__':
    unittest.main()
