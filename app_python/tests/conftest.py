import sys
from typing import AsyncGenerator

import pytest
from httpx import AsyncClient


# Add source to the search path and import app.
sys.path.append('./src/')
from app_python.api import app


@pytest.fixture(scope='session')
def anyio_backend():
    return 'asyncio'


@pytest.fixture(scope='session')
async def client() -> AsyncGenerator[AsyncClient, None]:
    async with AsyncClient(app=app, base_url='http://app_python') as client:
        yield client
