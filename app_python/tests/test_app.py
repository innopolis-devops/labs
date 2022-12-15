import re
from app import app


def test_get_time():
    """
    GIVEN a Flask application configured for testing,
    WHEN the '/get_time' page is requested (GET),
    THEN that the response is and contains the date and time.
    """
    app.testing = True
    with app.test_client() as test_client:
        response = test_client.get("/get_time")
        assert re.match(
            r"<p>\d{4}:\d\d:\d\d \d\d:\d\d:\d\d MSK \+\d{4}</p>",
            response.data.decode("utf-8"),
        )
