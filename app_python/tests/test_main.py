import pytest
from flask import testing
from app_python.moscow_time import main


client = testing.FlaskClient(main.app)

@pytest.mark.parametrize(
    "path, expected",
    [("/", 200), ("/get_time", 404), ("/time", 404)]
)
def test_get_time(path, expected):
    response = client.get(path)
    assert response.status_code == expected


