'''Unit Tests for the Time App'''
# pylint: disable=missing-function-docstring
# pylint: disable=missing-class-docstring
# pylint: disable=C0202
import unittest
from re import search
import requests

class TestCase(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        try:
            cls.webpage = requests.get("http://localhost", timeout=20)
        except requests.ConnectionError as exc:
            raise unittest.SkipTest("Timeout has been raised") from exc

    def test_status_code_200(self):
        self.assertTrue(self.webpage.status_code == 200, msg="Wrong response code")

    def test_time_presense(self):
        self.assertTrue(bool(search('20[0-9][0-9] at [0-9][0-9]:[0-9][0-9]:[0-9][0-9]', \
            self.webpage.text)), msg="There is no time in format HH:MM:SS on webpage text")

    def test_confetti_presense(self):
        assert '<div class="confetti-piece">' in self.webpage.text

if __name__ == '__main__':
    unittest.main()
