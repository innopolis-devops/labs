import unittest
from datetime import datetime

from app import get_current_moscow_time, app


class UnitFuncTests(unittest.TestCase):
    def test_time_format(self):
        try:
            datetime.strptime(get_current_moscow_time(), "%H:%M:%S")
        except ValueError:
            self.fail("Wrong format of message string")


class AppTests(unittest.TestCase):
    def setUp(self) -> None:
        app.testing = True
        self.client = app.test_client()

    def test_main_page(self):
        result = self.client.get("/")
        self.assertEqual(result.status_code, 200)

    def test_missing_page(self):
        result = self.client.get("/missing_page")
        self.assertEqual(result.status_code, 404)


if __name__ == '__main__':
    unittest.main()
