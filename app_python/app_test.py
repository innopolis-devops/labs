'''
Unit-tests for the app.py module.
'''
import unittest
from time import time

from dateutil import parser

import app


class TestTimeApp(unittest.TestCase):
    '''
    Unit-tests for the app.py module.
    '''
    def setUp(self):
        self.start_time = time()

    def test_time_delta(self):
        '''
        Test that time delta is within one second
        '''
        time_str = app.get_time_str()
        milliseconds = parser.parse(time_str).timestamp()
        self.assertAlmostEqual(milliseconds, time(), delta=1)


if __name__ == "__main__":
    unittest.main()
