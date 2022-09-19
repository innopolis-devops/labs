""" Tests for timeapp module """
import time

from django.test import TestCase


class TestTimeapp(TestCase):
    """ Tests for timeapp module """

    def test_return_time(self):
        """ Test page with time """
        response = self.client.get('/time/now')
        self.assertIsNotNone(response.content)

    def test_return_time_different_on_refresh(self):
        """ Test page with time and check the time changes """
        resp1 = self.client.get('/time/now')
        time.sleep(1)
        resp2 = self.client.get('/time/now')
        self.assertNotEqual(resp1.content, resp2.content)
