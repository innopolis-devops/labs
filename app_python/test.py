"""Testing get_time function from the app module"""

import unittest
from time import sleep
import app


class TestStringMethods(unittest.TestCase):
    """The class to test app module functions"""

    def test_get_time(self):
        """Testing get_time from the app module"""
        time_format = "%b %d %Y %H:%M:%S"

        before = app.get_time(time_format)
        sleep(1)
        after = app.get_time(time_format)

        before_sec = before.split(':')[-1]
        after_sec = after.split(':')[-1]

        # the num of seconds before should be one second less that the seconds after
        self.assertEqual((int(before_sec) + 1) % 60, int(after_sec))


if __name__ == '__main__':
    unittest.main()
