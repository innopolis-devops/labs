from datetime import datetime, timezone
from app import format_time, hello_world, render_time_page

def init_test_data():
    return (
        datetime.fromtimestamp(0, timezone.utc),
        [ "Moscow", "London", "Aboba" ]
    )

def test_format():
    (time, tz_names) = init_test_data()
    results = [ tz_name + " time: 00:00:00" for tz_name in tz_names ]
    for (tz_name, result) in zip(tz_names, results):
        assert format_time(time, tz_name) == result

def test_page_render():
    (time, tz_names) = init_test_data()
    results = [ tz_name + " time: 00:00:00" for tz_name in tz_names ]
    for (tz_name, result) in zip(tz_names, results):
        time_string = format_time(time, tz_name)
        assert result in render_time_page(time_string)
