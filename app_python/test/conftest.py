import pytest
from msctime.app import app as msctime_app


@pytest.fixture()
def app():
    msctime_app.config.update({
        "TESTING": True,
    })

    yield msctime_app


@pytest.fixture()
def client(app):
    return app.test_client()
