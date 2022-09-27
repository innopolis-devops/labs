def test_get_request(client):
    response = client.get('/')
    assert response.status == '200 OK'
