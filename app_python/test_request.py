import responses


def test_availability():
    response = responses.Response(method="GET", url="http://127.0.0.1/")
    assert response.status == 200, "Uhm, the site is down"


test_availability()
