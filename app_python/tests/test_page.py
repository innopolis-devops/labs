def test_page(self):
    response = self.app.get('/')
    self.assertEqual(response.status_code, 200, 'No response')
