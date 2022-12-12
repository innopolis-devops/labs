import datetime
import pytz

from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_read_main():
    response = client.get("/api/v1/moscow_time")
    assert response.status_code == 200
    true_resp = datetime.datetime.now(pytz.timezone('Europe/Moscow')).strftime("%H:%M:%S, %m/%d/%Y")
    print(true_resp)
    print(response.json())
    assert response.json() == true_resp
