import unittest
from main import app

class TestApp(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_homepage(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Current Time in Moscow', response.data)

if __name__ == '__main__':
    unittest.main()