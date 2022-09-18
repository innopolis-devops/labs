import pytest
import responses
import requests
from time_app import app as time_app


@pytest.fixture()
def app():
    time_app.config['TESTING'] = True
    yield time_app


@pytest.fixture()
def web(app):
    return app.test_client()


def test1(web):
    rsp1 = responses.Response(
        method="GET",
        url="http://localhost/",
    )
    assert rsp1.status == 200


def test2(web):
    assert 'Current time is' in requests.get("http://127.0.0.1:80").text


if __name__ == '__main__':
    pytest.main()
