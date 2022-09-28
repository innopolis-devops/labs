def test_get_request(client):
    response = client.get('/')
    assert b'Moscow' in response.data
