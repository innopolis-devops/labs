from flask import testing
from app import app

client = testing.FlaskClient(app)


def test_request_to_existing_url():
    assert client.get('/').status_code == 200


def test_request_to_not_existing_url():
    assert client.get('/test').status_code == 404
