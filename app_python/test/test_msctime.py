def test_msctime(client):
    response = client.get("/")
    assert b"<h1>Moscow time</h1>" in response.data
