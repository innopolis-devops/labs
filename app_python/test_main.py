from flask import testing
from main import app

client = testing.FlaskClient(app)
def test_request_to_existing_endpoint():
    response = client.get('/')
    assert response.status_code == 200

def test_request_to_not_existing_endpoint():
    response = client.get('/undefined')
    assert response.status_code != 200