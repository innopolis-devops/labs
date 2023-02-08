from datetime import datetime
import unittest

import time_utils


class TestTimeApp(unittest.TestCase):

    # test time localization does not apply LMT
    def test_get_timezone(self):
        date = datetime(2000, 1, 1, 0, 0)
        datetime1 = time_utils.get_timezone("Europe", "Moscow").localize(date)
        datetime2 = time_utils.get_timezone("Europe", "Kirov").localize(date)
        self.assertEqual(datetime2, datetime1)
        self.assertNotEqual(time_utils.get_timezone("Europe", "Moscow"), time_utils.get_timezone("Europe", "Kirov"))

    # test time correct formatting
    def test_format_time(self):
        self.assertEqual(time_utils.format_time(datetime.utcfromtimestamp(1331856982)), "00:16:22")


if __name__ == '__main__':
    unittest.main()
