import pytest
from moscow_time.main import app 

@pytest.mark.parametrize(
    "path, expected",
    [("/", 200), ("/time", 404), ("/something", 404), ("/timezone", 404)],
)
def test_get_time(path, expected):
    with app.test_client() as testing_client:
        response = testing_client.get(path)
        assert response.status_code == expected
