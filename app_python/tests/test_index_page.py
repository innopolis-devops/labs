from datetime import datetime
import time
import re
from freezegun import freeze_time

from src.consts import TIME_FORMAT


def check_and_get_time(response: bytes) -> datetime:
    decoded = response.decode()
    assert "Hello from Python app!" in decoded, f"response: {decoded}"
    match = re.search(r"MSK time: ([\d:]+)", decoded)
    assert match is not None, f"response: {decoded}"
    time = match.group(1)
    time = datetime.strptime(time, TIME_FORMAT)
    return time


def test_index_page(client):
    with freeze_time("2022-09-17 10:58:22") as frozen_datetime:
        first = client.get("/")
        first_time = check_and_get_time(first.data)
        frozen_datetime.tick(1)
        second = client.get("/")
        second_time = check_and_get_time(second.data)
        delta = (second_time - first_time).total_seconds()
        assert delta == 1, f"delta is wrong: {delta}"
