"""
This is a Unit test for app.py
"""
import re
from app_python.app import app

def test_home_page():
    """
    GIVEN a Flask application configured for testing,
    WHEN the '/' page is requested (GET),
    THEN that the response is and contains the date and time.
    """
    with app.test_client() as test_client:
        response = test_client.get("/")
        assert response.status_code == 200
        assert re.match(
            r"<h1>\d\d:\d\d:\d\d - \d\d/\d\d/\d{4}</h1>",
            response.data.decode("utf-8"),
        )
test_home_page()
