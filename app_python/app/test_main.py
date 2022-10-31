import re
from fastapi.testclient import TestClient
from app.main import app
from bs4 import BeautifulSoup

client = TestClient(app)


def test_read_main():
    """check if GET / html contains the word "Moscow"
    """
    response = client.get("/")
    assert response.status_code == 200

    soup = BeautifulSoup(response.text, "html.parser")
    matches = soup.find_all("h1", string=re.compile("Moscow"))
    assert bool(matches)
