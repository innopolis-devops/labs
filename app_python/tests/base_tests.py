import requests


def test_request_response():
    response = requests.get('http://0.0.0.0:8000')
    assert response.status_code == 200


def test_request_type():
    response = requests.get('http://0.0.0.0:8000')
    print(response.text)
    assert isinstance(response.text, str)
