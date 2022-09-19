from fastapi.testclient import TestClient

from .main import app

client = TestClient(app)


def test_get_current_time():
    response = client.get("/")
    assert response.status_code == 200
    assert "current_time" in response.json()
