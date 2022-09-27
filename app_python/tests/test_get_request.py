def test_get_request(client):
    response = client.get('/')
    assert b'Current time' in response.data
