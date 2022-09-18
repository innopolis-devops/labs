import pytest
from app.main import app
from fastapi.testclient import TestClient

client = TestClient(app)

def test_routes():
    check_route("/", 200)
    check_route("/aboba", 404)
    check_route("/wrong_path", 404)
    check_route("/wrong", 404)


def check_route(route, expected_status):
    response = client.get(route)
    assert response.status_code == expected_status
