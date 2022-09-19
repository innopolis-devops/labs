from utils.main import get_current_time_formatted
from datetime import datetime
import pytz

def test_sum():
    assert isinstance(get_current_time_formatted(), datetime)