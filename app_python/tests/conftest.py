from venv import create
import pytest
import app
from app import create_app

@pytest.fixture
def client():
    '''Creating a test client'''
    app = create_app()

    with app.test_client() as client:
        with app.app_context():
            yield client