# Third party modules
import pytest

# First party modules
from app import app


@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client


def test_time(client):
    r = client.get("/")
    assert r.status_code == 200