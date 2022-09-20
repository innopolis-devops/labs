'''
Module contains setup functions.
'''
import pytest
from src.app import create_app


@pytest.fixture()
def app():
    app = create_app()
    app.config.update(
        {
            'TESTING': True,
        }
    )
    return app

'''
Tests will use the client to make requests to 
the application without running the server.
'''
@pytest.fixture()
def client(app):
    return app.test_client()

'''
Creates a runner that can call the Click 
commands registered with the application.
'''
@pytest.fixture()
def runner(app):
    return app.test_cli_runner()