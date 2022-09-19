import pytest

from msk_time.app import app


@pytest.fixture
def client():
    with app.test_client() as client:
        yield client


@pytest.mark.parametrize(
    "path, expected",
    [("/", 200), ("/not_existing_path", 404)],
)
def test_get_time(path, expected, client):
    response = client.get(path)
    assert response.status_code == expected
