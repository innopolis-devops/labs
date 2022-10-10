import pytest
from app import make_app

pytest_plugins = "aiohttp.pytest_plugin"


@pytest.fixture
async def api_client(aiohttp_client):
    app = make_app("test_app", up_metrics=False)
    client = await aiohttp_client(app)

    try:
        yield client
    finally:
        await client.close()
