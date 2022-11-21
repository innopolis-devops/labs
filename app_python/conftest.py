import pytest
from app import make_app
from config import default_config

pytest_plugins = "aiohttp.pytest_plugin"


@pytest.fixture
async def api_client(aiohttp_client):
    config = default_config
    app = make_app(config, up_metrics=False)
    client = await aiohttp_client(app)

    try:
        yield client
    finally:
        await client.close()
