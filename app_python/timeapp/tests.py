import time

from django.test import TestCase


class TestTimeapp(TestCase):

    def test_return_time(self):
        response = self.client.get('/time/now')
        self.assertIsNotNone(response.content)

    def test_return_time_different_on_refresh(self):
        resp1 = self.client.get('/time/now')
        time.sleep(1)
        resp2 = self.client.get('/time/now')
        self.assertNotEqual(resp1.content, resp2.content)
