import pytest


@pytest.mark.freeze_time("12:21:12", tz_offset=-3)
@pytest.mark.parametrize(
    "endpoint, status, substr",
    [("/", 200, "Time in Moscow is 12:21:12"), ("/not-found", 404, None)],
)
async def test_endpoints(endpoint, status, substr, api_client):
    resp = await api_client.get(endpoint)
    assert resp.status == status
    if substr is not None:
        assert substr in await resp.text()
