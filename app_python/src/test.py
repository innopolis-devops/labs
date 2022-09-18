import unittest
from datetime import datetime
import pytz
import app as tested_app


class FlaskAppTests(unittest.TestCase):
    def setUp(self):
        tested_app.app.config['TESTING'] = True
        self.app = tested_app.app.test_client()

    def test_moscow_time(self):
        r = self.app.get('/')

        tz = pytz.timezone('Europe/Moscow')
        moscow_time = datetime.now(tz)
        moscow_time = datetime(moscow_time.year, moscow_time.month,
                               moscow_time.day, moscow_time.hour,
                               moscow_time.minute, moscow_time.second)

        date_time_obj = datetime.strptime(r.data.decode("utf-8"),
                                          'Moscow time - %m/%d/%Y, %H:%M:%S')

        self.assertLess(date_time_obj.timestamp() - moscow_time.timestamp(), 5,
                        "Moscow time not equal to real one")


if __name__ == '__main__':
    unittest.main()
