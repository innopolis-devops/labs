import re

import pytest

from app import app


def test_app():
    """
    GIVEN a Flask application configured for testing,
    WHEN the '/' page is requested (GET),
    THEN that the response is and contains the date and time.
    """
    with app.test_client() as test_client:
        response = test_client.get("/")
        assert response.status_code == 200
        assert re.search(
            r"Hello world! Time is:\d\d:\d\d:\d\d",
            response.data.decode("utf-8"),
        )
