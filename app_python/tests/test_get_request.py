def test_get_request(client):
    response = client.get('/')
    assert b'current time' in response.data
