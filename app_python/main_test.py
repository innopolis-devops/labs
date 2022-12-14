import unittest
from pytz import timezone
import datetime

import main


class TestStringMethods(unittest.TestCase):
    def test_time(self):
        time_a = main.get_msk_time()
        time_b = datetime.datetime.now().astimezone()
        self.assertAlmostEqual(
            time_a, time_b, delta=datetime.timedelta(seconds=1))


if __name__ == '__main__':
    unittest.main()
