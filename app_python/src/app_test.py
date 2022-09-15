from datetime import datetime, timezone
from app import format_time, hello_world, render_time_page


def init_test_data():
    return [
        (
            datetime.fromtimestamp(0, timezone.utc),
            "Moscow",
            "Moscow time: 00:00:00",
        ),
        (
            datetime.fromtimestamp(123456789, timezone.utc),
            "Moscow",
            "Moscow time: 21:33:09",
        ),
        (
            datetime.fromtimestamp(0, timezone.utc),
            "London",
            "London time: 00:00:00",
        ),
        (
            datetime.fromtimestamp(0, timezone.utc),
            "",
            " time: 00:00:00",
        ),
    ]


def test_format_time():
    for (time, tz_name, result) in init_test_data():
        assert format_time(time, tz_name) == result


def test_page_render_autoformatted_time():
    for (time, tz_name, result) in init_test_data():
        ft = format_time(time, tz_name)
        assert result in render_time_page(ft)


def test_page_render_arbitrary_strings():
    sample_strings = [
        "It's devops time!",
        "Doomsday clock time: 23:58:20",
        format_time(datetime.fromtimestamp(86300, timezone.utc), "Doomsday clock"),
        "",
    ]
    for s in sample_strings:
        assert s in render_time_page(s)
