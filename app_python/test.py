import unittest
from time import sleep
import app


class TestStringMethods(unittest.TestCase):
    def test_get_time(self):
        format = "%b %d %Y %H:%M:%S"

        before = app.get_time(format)
        sleep(1)
        after = app.get_time(format)

        before_sec = before.split(':')[-1]
        after_sec = after.split(':')[-1]

        # the num of seconds before should be one second less that the seconds after
        self.assertEqual((int(before_sec) + 1) % 60, int(after_sec))


if __name__ == '__main__':
    unittest.main()
