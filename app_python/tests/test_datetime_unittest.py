import unittest
import pytz
from datetime import datetime, timedelta

class TestDatetime(unittest.TestCase):
    def test_moscow_timezone(self):
        timez_utc = pytz.utc
        timez_msk = pytz.timezone('Europe/Moscow')
        moscow_time = datetime.now(timez_msk)
        utc_time = datetime.now(timez_utc)
        self.assertEqual((utc_time + timedelta(hours=3)).strftime('%H:%M'), moscow_time.strftime('%H:%M'), 'MSK should be equal to UTC+3')

    def test_strftime(self):
        timez_msk = pytz.timezone('Europe/Moscow')
        msk_time = datetime.strptime('14:00:01', '%H:%M:%S')
        self.assertEqual(msk_time.strftime('%H:%M:%S'), '14:00:01', 'MSK strftime should be equal to 14:00:01')

if __name__ == '__main__':
    unittest.main()
