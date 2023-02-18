from app import app
import datetime
import pytz


def test_get_time():
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200

    expected_tz = pytz.timezone("Europe/Moscow")
    current_time = datetime.datetime.now(tz=expected_tz)
    expected_time = current_time.strftime("%d.%m.%Y %H:%M:%S")

    assert expected_time.encode() in response.data


test_get_time()
