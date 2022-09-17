import pytest
from pytest_mock import MockerFixture
from starlette.testclient import TestClient

from superclock import app

client = TestClient(app)


@pytest.mark.parametrize("target_str", [
    "11:23:56",
    "05:23:56",
    "05:03:02",
    "00:00:00",
    "23:59:59",
    ])
def test_main(mocker: MockerFixture, target_str: str):
    mocker.patch('superclock.timezone_clock.TimezoneClock.get_time_str', return_value=target_str)
    responce = client.get('/')
    assert responce.status_code == 200
    assert responce.content.decode().find(target_str) > 0
