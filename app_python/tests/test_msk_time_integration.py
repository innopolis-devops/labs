"""Tests module."""
import unittest

from app.service import msk_time
from app.view import html_response


class TestService(unittest.TestCase):
    """Integration tests for service.py"""

    def test_html_output(self):
        """Test that a function renders html in a right way"""
        current_time = msk_time()
        html = html_response("Moscow", current_time)
        self.assertEqual(200, html.status_code)
        self.assertTrue("<title>Moscow time</title>" in str(html.body))
        self.assertTrue(f'Moscow time is {current_time}' in str(html.body))


if __name__ == "__main__":
    unittest.main()
