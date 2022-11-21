import pytest


@pytest.fixture()
def tz_now_html_response(now, tz):
    return f'<h1>{now.astimezone(tz)}</h1>'


def test_get_current_time(client, tz_now_html_response):
    response = client.get('/')

    assert response.status_code == 200
    assert response.text == tz_now_html_response


def test_get_visits(client):
    response = client.get('/visits')

    assert response.status_code == 200
    visits_before = int(
        response.text.replace('<h1>Visits: ', '').replace('</h1>', '')
    )

    client.get('/')
    response = client.get('/visits')

    assert response.status_code == 200
    visits_after = int(
        response.text.replace('<h1>Visits: ', '').replace('</h1>', '')
    )

    assert visits_after == visits_before + 1
