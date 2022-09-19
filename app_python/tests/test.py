import re

import pytest

from server import app


def test_python_app():
    """
    GIVEN a Flask application configured for testing,
    """
    with app.test_client() as test_client:
        response = test_client.get("/")
        assert response.status_code == 200
        assert re.search(
            r"Time in Moscow: \d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d.\d\d\d\d\d\d\+\d\d:\d\d",
            response.data.decode("utf-8"),
        )
        
        
       
