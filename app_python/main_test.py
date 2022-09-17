from fastapi.testclient import TestClient
import pytest
from main import app

client = TestClient(app)


@pytest.mark.freeze_time("2022-12-31 12:12:12", tz_offset=-3)
@pytest.mark.parametrize("path, expected_status, expected_result", [
    ("/", 200, "31-12-2022 12:12:12 MSC"),
    ("/time", 404, None)
])
def test_get_time(path, expected_status, expected_result):
    response = client.get(path)
    assert response.status_code == expected_status
    if expected_status == 200:
        assert response.text == expected_result
