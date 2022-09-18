from fastapi.testclient import TestClient
from datetime import date, datetime

from .main import app

client = TestClient(app)


def test_get_main():
    response = client.get("/")
    assert response.status_code == 200


def test_docs():
    response = client.get("/docs")
    assert response.status_code == 200


def test_date():
    response = client.get("/")
    msk_time = response.json()['msk_time']
    today = date.today()
    test_date = datetime.strptime(msk_time.split()[1], '%d.%m.%Y').date()
    assert today == test_date
