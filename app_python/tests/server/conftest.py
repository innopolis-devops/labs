import pytest
from starlette.testclient import TestClient

from server.app import app


@pytest.fixture()
def client():
    with TestClient(app) as _client:
        yield _client
