from datetime import datetime, timedelta
from app import app
import pytz

def test_time():
    with app.test_client() as client:
        time = datetime.now(pytz.timezone("Europe/Moscow"))

        res = client.get('/')
        assert res.status_code == 200

        res_time = datetime.fromisoformat(res.text)

        delta = res_time - time
        assert delta < timedelta(seconds=10)