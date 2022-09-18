"""
This suite tests the accessibility & validity for all the endpoints on the server
"""

import pytest
from app import app as my_app


@pytest.fixture()
def app():
    my_app.config.update({"TESTING": True})
    yield my_app


@pytest.fixture()
def client(app):
    return app.test_client()


def test_home_route(client):
    """
    Make sure we get valid home page when accessing route home, '/'
    """
    resp = client.get("/")
    assert b"<h2>What time is it in Moscow?</h2>" in resp.data
