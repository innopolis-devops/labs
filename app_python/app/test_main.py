from fastapi.testclient import TestClient
from .main import fast_api
import pytz
import pytest
from datetime import datetime
from datetime import timedelta

client = TestClient(fast_api)


@pytest.fixture()
def current_time():
    return datetime.now(pytz.timezone('Europe/Moscow'))


def test_read_main(current_time):

    time_before_request = current_time

    response = client.get("/")
    assert response.status_code == 200

    response_time = datetime.strptime(
        response.text,
        '\"Today is %d/%m/%Y! Time is %H:%M:%S, have a nice day :)\"')
    response_time = response_time.replace(
        tzinfo=pytz.timezone('Europe/Moscow'))

    difference = time_before_request - response_time

    # testing time correctness
    assert difference < timedelta(seconds=10)
