import unittest

import app
from time import time

from dateutil import parser


class Test(unittest.TestCase):

    def moscow_time_test(self):
        msc_time = app.show_time()
        self.assertAlmostEqual(parser.parse(msc_time).timestamp(), time(), delta=1)


if __name__ == "__main__":
    unittest.main()
