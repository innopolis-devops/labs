from datetime import datetime

import pytest
from freezegun import freeze_time

from server.router import tz as _tz


@pytest.fixture(autouse=True)
def _freeze_time():
    with freeze_time():
        yield


@pytest.fixture()
def now():
    return datetime.utcnow()


@pytest.fixture()
def tz():
    return _tz
