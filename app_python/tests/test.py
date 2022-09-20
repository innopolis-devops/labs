import pytest
from flask import testing
from App import app

client = testing.FlaskClient(app.app)

@pytest.mark.parametrize(
    'url, exp_code',
    [('/', 200), ('/hello_world', 404)]
)
def test_req(url, exp_code):
    resp = client.get(url)
    assert resp.status_code == exp_code
