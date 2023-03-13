import pytest

import main


@pytest.fixture
def client():
    with main.app.test_client() as client:
        yield client


@pytest.mark.parametrize(
    "path, expected",
    [("/", 200), ("/error", 404)],
)
def test_get_time(path, expected, client):
    response = client.get(path)
    assert response.status_code == expected
