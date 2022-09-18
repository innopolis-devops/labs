import unittest
import requests
from re import search

from main import app

class TestCase(unittest.TestCase):

    @classmethod
    def setUpClass(self):
        try:
            self.webpage = requests.get("http://localhost:5000")    
        except requests.ConnectionError:
            raise unittest.SkipTest("Service is offline")
        

    def test_httpcode_200(self):
        self.assertTrue(self.webpage.status_code == 200, msg="The service is online but have wrong response code")

    def test_shown_time(self):
        self.assertTrue(bool(search('[0-9][0-9]:[0-9][0-9]:[0-9][0-9]', self.webpage.text)), \
            msg="There is no time in format HH:MM:SS on webpage text")


if __name__ == '__main__':
    unittest.main()