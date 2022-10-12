import datetime
import pytest
from fastapi.testclient import TestClient

from app.api import app

client = TestClient(app)


# Status checks


def get_status() -> dict:
    status_response = client.get("/status")
    assert status_response.status_code == 200, "The response must be of status code 200"
    assert status_response.elapsed.seconds < 0.1, "The request must not take too long"
    status = status_response.json()
    assert status["status"] == "ok", "Status must be 'ok'"
    return status


@pytest.mark.order("first")
@pytest.mark.asyncio
async def test_initial_status():
    assert (
        get_status().get("requests_served") == 0
    ), "Initially there should be 0 requests served"


@pytest.mark.order("last")
@pytest.mark.asyncio
async def test_final_status():
    assert (
        get_status().get("requests_served") == 2
    ), "There should be exactly 2 successfully served requests"


# Default route tests


@pytest.mark.asyncio
async def test_time_request():
    response = client.get("/")
    assert response.status_code == 200, "The response must be of status code 200"
    assert response.elapsed.seconds < 0.1, "The request must not take too long"


@pytest.mark.asyncio
async def test_time_format():
    response = client.get("/")
    ctime_format = "%a %b %d %H:%M:%S %Y"
    try:
        datetime.datetime.strptime(response.text, ctime_format)
    except ValueError as e:
        pytest.fail(str(e))


# Error handling tests


@pytest.mark.asyncio
async def test_non_existent_route():
    assert client.get("/bamog").status_code == 404


@pytest.mark.asyncio
async def test_unsupported_method():
    assert client.post("/").status_code == 405
