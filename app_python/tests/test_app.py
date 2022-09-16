import datetime
import pytest
from fastapi.testclient import TestClient

from app.api import app

client = TestClient(app)
response = client.get("/")


@pytest.mark.asyncio
async def test_time_request():
    assert response.status_code == 200, "The response must be of status code 200"
    assert response.elapsed.seconds < 0.1, "The request must not take too long"


@pytest.mark.asyncio
async def test_time_format():
    ctime_format = "%a %b %d %H:%M:%S %Y"
    try:
        datetime.datetime.strptime(response.text, ctime_format)
    except ValueError as e:
        pytest.fail(str(e))


@pytest.mark.asyncio
async def test_non_existent_route():
    assert client.get("/bamog").status_code == 404


@pytest.mark.asyncio
async def test_unsupported_method():
    assert client.post("/").status_code == 405
