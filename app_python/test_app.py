import pytest
import datetime
from app import app


@pytest.fixture
def client():
    app.config['TESTING'] = True

    with app.test_client() as client:
        yield client


def test_app(client):
    response = client.get('/')
    assert response.status_code == 200, "Status code should be 200"
    assert datetime_test(response.text.replace('Now in Moscow: ', ''))


def datetime_test(response_datetime):
    try:
        datetime.datetime.strptime(response_datetime, '%d-%m-%Y %H:%M:%S')
    except Exception:
        return False
    return True


def test_invalid_responses(client):
    response_404 = client.get('/anything')
    assert response_404.status_code == 404

    response_405 = client.post('/')
    assert response_405.status_code == 405
