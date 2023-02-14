import pytest
from flask.testing import FlaskClient

from app import app

client: FlaskClient = app.test_client()


@pytest.fixture(autouse=True)
def freeze_time(monkeypatch):
    from freezegun import freeze_time
    with freeze_time('2020-01-01 00:00:00'):
        yield


EXPECTED_RESPONSE = b'''
<!DOCTYPE html>
<html>
<head>
    <title>Lab 1</title>
</head>
<body>
    <h1>Current time: 03:00:00</h1>
</body>
</html>'''


def test_show_time():
    response = client.get('/')
    assert response.status_code == 200
    assert response.data == EXPECTED_RESPONSE
    assert response.headers['Content-Type'] == 'text/html; charset=utf-8'
