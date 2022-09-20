import unittest
from time_utils import format_time, get_msc_timezone, get_current_time
from datetime import datetime


class TestTimeUtils(unittest.TestCase):

    def test_get_current_time(self):
        today = datetime.today()
        actual_utcoffset = get_current_time().tzinfo.utcoffset(today)
        expected_utcoffset = get_msc_timezone().utcoffset(today)
        self.assertEqual(actual_utcoffset, expected_utcoffset)

    def test_format_time_normal(self):
        time = datetime(year=2000, month=1, day=2, hour=3, minute=4, second=5)
        self.assertEqual(format_time(time), "01/02/2000, 03:04:05")

    def test_format_time_zero(self):
        time = datetime(year=1, month=1, day=1, hour=0, minute=0, second=0)
        self.assertEqual(format_time(time), "01/01/0001, 00:00:00")

    def test_format_time_none(self):
        with self.assertRaises(TypeError):
            format_time(None)


if __name__ == "__main__":
    unittest.main()
