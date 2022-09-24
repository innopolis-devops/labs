import unittest
from re import search
from main import create_app

class TestWebApp(unittest.TestCase):

    def setUp(self):
        self.app = create_app()
        self.client = self.app.test_client()

    def tearDown(self):
        self.app = None
        self.client = None

    def test_httpcode_200(self):
        response = self.client.get("/")
        self.assertTrue(response.status_code == 200, msg="The service is online but have wrong response code")

    def test_shown_time(self):
        response = self.client.get("/")
        self.assertTrue(bool(search('[0-9][0-9]:[0-9][0-9]:[0-9][0-9]', response.text)), \
            msg="There is no time in format HH:MM:SS on webpage text")

    def test_nonexisting_page(self):
        response = self.client.get("/notexist")
        self.assertTrue(response.status_code == 404, msg="Non existing page do not return code 404")

if __name__ == '__main__':
    unittest.main()