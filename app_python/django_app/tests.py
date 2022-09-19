""" Tests for core module """

from django.test import TestCase


class TestApp(TestCase):
    """ Tests for core module """

    def test_404(self):
        """ Test not found page """
        response = self.client.get('/non-existing-page')
        self.assertEqual(response.status_code, 404)
