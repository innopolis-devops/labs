import pytest
import requests

def test_world_time_api():
    url = 'http://worldtimeapi.org/api/timezone/Europe/Moscow'  # link
    time_zone_moscow = requests.get(url)  # a request to retrieve the data
    assert time_zone_moscow.status_code == 200
