from unittest.mock import patch
from django.test import TestCase

from .. import utils


class SuccessfulResponse:
    def __init__(self):
        self.status_code = 200

    def json(self):
        full_datetime = '2020-04-30T12:48:54.398875+02:00'
        return {
            "datetime": full_datetime,
        }


class FailedResponse:
    def __init__(self):
        self.status_code = 404

    def json(self):
        return {}


class TestUtils(TestCase):
    @patch("requests.get", return_value=SuccessfulResponse())
    def test_get_moscow_time_successful(self, mocked):
        formatted_datetime = '12:48:54'
        self.assertEqual(utils.get_moscow_time(), formatted_datetime)

    @patch("requests.get", return_value=FailedResponse())
    def test_get_moscow_time_failed(self, mocked):
        self.assertEqual(utils.get_moscow_time(), "error")
