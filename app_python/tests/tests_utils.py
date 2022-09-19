import sys
sys.path.append("../")
from utils.main import get_current_time_formatted
from datetime import datetime

def test_sum():
    assert isinstance(get_current_time_formatted(), datetime)