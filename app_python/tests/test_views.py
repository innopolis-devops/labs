import pytest

from app_python.main import app


class TestClient:

    # set test_client
    def setup(self):
        app.testing = True
        self.client = app.test_client()

    def teardown(self):
        self.client.__exit__(None, None, None)


@pytest.mark.parametrize(
    "timezone", [("Africa-Abidjan"), ('Europe-Vienna'), ('America-New_York')]
)
class TestTimezoneViews(TestClient):

    def test_user_right_time_set(self, timezone):
        response = self.client.get(f"/{timezone}")
        assert response.status_code == 200


class TestOtherViews(TestClient):

    def test_home_page(self):
        response = self.client.get('/')
        assert response.status_code == 200

    def test_wrong_api_call(self):
        response = self.client.get("/bring-power")
        assert response.status_code == 200, "Big secrets are revealed"
