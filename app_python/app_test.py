import unittest

import app
from time import time

from dateutil import parser


class Test(unittest.TestCase):

    def test_moscow_time(self):
        msc_time = app.show_time()
        time_to_seconds = parser.parse(msc_time).timestamp()
        self.assertAlmostEqual(time_to_seconds, time(), delta=11000)


if __name__ == "__main__":
    unittest.main()
