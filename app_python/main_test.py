from fastapi.testclient import TestClient
import pytest
from main import app

client = TestClient(app)

@pytest.mark.freeze_time("2022-12-31 12:12:12", tz_offset=-3)
def test_get_time():
    response = client.get("/")
    assert response.status_code == 200
    assert response.text == "31-12-2022 12:12:12 MSC"
    
def test_get_time_wrong_endpoint():
    response = client.get("/time")
    assert response.status_code == 404
    