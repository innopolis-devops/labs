import pytest
import requests
import sys
sys.path.append("..")
import server

"""important to run the server before test"""
def test_response_code():
    """testing response status can be important in further communication with server"""
    with server.app.test_client() as demo:
        req = demo.get("/")
        status_code = req.status_code
        assert status_code == 200, "Something went wrong"


