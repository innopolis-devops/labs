import unittest
import pytz
import requests
import time
from datetime import datetime, timedelta

endpoint = 'http://127.0.0.1:50000/'

class TestWeb(unittest.TestCase):
    def test_endpoint_works(self):
        session = requests.Session()
        answer = session.get(endpoint)
        self.assertEqual(answer.status_code, 200, 'Wrong answer. The returned code != 200')

    def test_time_returned_same(self):
        timez_msk = pytz.timezone('Europe/Moscow')
        session = requests.Session()

        cur_time = session.get(endpoint).text.split(' ')[-1]
        cur_time = datetime.strptime(cur_time, '%H:%M:%S')
        moscow_time = datetime.now(timez_msk)
        self.assertEqual(moscow_time.strftime('%H:%M:%S'), cur_time.strftime('%H:%M:%S'), 'Wrong time')

    def test_time_returned_different(self):
        timez_msk = pytz.timezone('Europe/Moscow')
        session = requests.Session()

        moscow_time = datetime.timestamp(datetime.now(timez_msk))
        time.sleep(1) # sleep for 1 second
        cur_time = session.get(endpoint).text.split(' ')[-1]
        cur_time = datetime.timestamp(datetime.strptime(cur_time, '%H:%M:%S'))
        self.assertNotEqual(moscow_time, cur_time, 'Returned time should be different')

if __name__ == '__main__':
    unittest.main()
