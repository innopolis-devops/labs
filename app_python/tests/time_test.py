import unittest
import pytz
from app import current_time
from datetime import datetime

moscow_timezone = pytz.timezone('Europe/Moscow')
time_format = '%H:%M:%S'


class MyTestCase(unittest.TestCase):
    def test_current_time_display(self):
        # current time
        time = datetime.now(moscow_timezone).time().replace(microsecond=0)
        # current time according to the app
        date_string = current_time(moscow_timezone)
        print(date_string)
        server_time = datetime.strptime(date_string, time_format).time()
        self.assertEqual(time, server_time)


if __name__ == '__main__':
    unittest.main()
