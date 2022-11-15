"""Tests module."""
import unittest
import time
from datetime import datetime, timedelta

from app.service import msk_time


def test_timeinterval(self, seconds):
    """Utility function to test msk_time function in a given time interval"""
    time1 = msk_time()
    time.sleep(seconds)
    time2 = msk_time()

    format_date = "%Y-%m-%d %H:%M:%S"
    datetime1 = datetime.strptime(time1.replace(" MSK+0300", ""), format_date)
    datetime2 = datetime.strptime(time2.replace(" MSK+0300", ""), format_date)

    self.assertEqual(datetime2 - timedelta(seconds=seconds), datetime1)


class TestService(unittest.TestCase):
    """Unit tests for service.py"""

    def test_msk_time_updates_each_second(self):
        """Test that time changes after each second"""
        seconds = 1
        test_timeinterval(self, seconds)

    def test_msk_time_updates_each_2_second(self):
        """Test that time changes correctly after 2 seconds"""
        seconds = 2
        test_timeinterval(self, seconds)


if __name__ == "__main__":
    unittest.main()
