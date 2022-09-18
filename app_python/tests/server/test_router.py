import pytest


@pytest.fixture()
def tz_now_html_response(now, tz):
    return f'<h1>{now.astimezone(tz)}</h1>'


def test_get_current_time(client, tz_now_html_response):
    response = client.get('/')

    assert response.status_code == 200
    assert response.text == tz_now_html_response
