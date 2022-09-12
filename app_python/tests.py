"""Tests module."""
import unittest
import time
from datetime import datetime, timedelta
from service import msk_time


class TestService(unittest.TestCase):
    """Tests for service.py"""

    def test_msk_time_updates_each_second(self):
        """Test that time changes after each second"""
        format_date = "%Y-%m-%d %H:%M:%S %Z%z"

        time1 = msk_time()
        time.sleep(1)
        time2 = msk_time()

        self.assertEqual(datetime.strptime(time2, format_date) - timedelta(seconds=1),
                         datetime.strptime(time1, format_date))


if __name__ == "__main__":
    unittest.main()
