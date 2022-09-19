from test_page import test_page
from test_time import test_time
import sys
from pathlib import Path
sys.path[0] = str(Path(sys.path[0]).parent)

import app as testing
import unittest


class TestApp(unittest.TestCase):
    def setUp(self):
        testing.app.config['TESTING'] = True
        self.app = testing.app.test_client()

    def tearDown(self):
        pass

    def test_app(self):
        test_page(self)
        test_time(self, testing)
        

if __name__ == "__main__":
    unittest.main()
