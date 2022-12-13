"""
This file (test_main_page.py) contains the unit tests for the app.py file.
"""

import time
import re

def test_main_page(client):
    """
    GIVEN Moscow time website
    WHEN a visitor reloads the page for 1 second
    THEN check the timezone is correct, the time displayed is not empty and is different
    """

    response_1 = client.get('/')
    time.sleep(1)
    response_2 = client.get('/')

    assert b'Europe/Moscow' in response_1.data
    assert b'Europe/Moscow' in response_2.data
    t_1 = re.search(r'\d\d:\d\d:\d\d', str(response_1.data)).group(0)
    t_2 = re.search(r'\d\d:\d\d:\d\d', str(response_2.data)).group(0)
    assert t_1 is not None
    assert t_2 is not None
    assert t_1 != t_2
    