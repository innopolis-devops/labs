import pytest
from ..tttime.app import app as flask_application


@pytest.fixture()
def app():

    flask_application.config.update({
        "TESTING": True,
    })

    yield flask_application


@pytest.fixture()
def client(app):
    return app.test_client()


@pytest.fixture()
def runner(app):
    return app.test_cli_runner()
