from datetime import datetime, timedelta

import pytz
from app import app
from fastapi.testclient import TestClient

tz = pytz.timezone("Europe/Moscow")
client = TestClient(app)


def test_moscow_time():
    time = datetime.now(tz)

    resp = client.get("/")
    assert resp.status_code == 200

    time_recv = datetime.fromisoformat(resp.text)
    delta = time - time_recv

    assert time.utcoffset() == time_recv.utcoffset()
    assert delta < timedelta(minutes=1)
