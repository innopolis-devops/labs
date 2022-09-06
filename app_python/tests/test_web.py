import unittest
import pytz
import requests
from datetime import datetime, timedelta

endpoint = 'http://127.0.0.1:50000/'

class TestWeb(unittest.TestCase):
    def test_time_returned(self):
        timez_msk = pytz.timezone('Europe/Moscow')
        session = requests.Session()

        cur_time = session.get(endpoint).text.split(' ')[-1]
        cur_time = datetime.strptime(cur_time, '%H:%M:%S')
        moscow_time = datetime.now(timez_msk)
        self.assertEqual(moscow_time.strftime('%H:%M:%S'), cur_time.strftime('%H:%M:%S'), 'Wrong time')

        new_time = session.get(endpoint).text.split(' ')[-1]
        self.assertNotEqual(new_time, cur_time, 'Returned time should be different')

if __name__ == '__main__':
    unittest.main()
