from freezegun import freeze_time


def test_get_moscow_time_200(client):
    response = client.get("/")
    assert response.status_code == 200


def test_get_moscow_time_404(client):
    response = client.get("/time")
    assert response.status_code == 404


def test_get_moscow_time(client):
    with freeze_time("2001-09-21 21:00:00", tz_offset=-3):
        response = client.get("/")
        assert response.text.find('<p>22:00:00</p>') != -1
