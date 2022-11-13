import pytest
from time_app import app as time_app


@pytest.fixture()
def app():
    time_app.config.update({
        "TESTING": True,
    })

    yield time_app


@pytest.fixture()
def client(app):
    return app.test_client()


def test(client):
    resp = client.get("/")
    assert b"<title>Time in UTC + 3</title>" in resp.data


if __name__ == '__main__':
    pytest.main()
