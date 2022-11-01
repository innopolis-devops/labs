import asyncio
from datetime import time, datetime, timezone
from typing import Optional
from zoneinfo import ZoneInfo

import pytest
from httpx import AsyncClient
from starlette import status


async def get_time(client: AsyncClient, *, zone: Optional['str'] = None) -> datetime:
    params = {}
    if zone is not None:
        params['zone'] = zone

    response = await client.get('/v1/time', params=params)
    assert response.status_code == status.HTTP_200_OK, f'Invalid response code: {response.status_code}.'

    response_time = response.json().get('time')
    assert response_time is not None, f'Invalid body: {response.json()}.'

    try:
        response_time = datetime.fromisoformat(response_time)

    except Exception as exception:
        raise Exception(f'Cannot parse time: {response_time}.') from exception

    assert response_time.tzinfo is not None, 'Invalid timezone.'
    return response_time


@pytest.mark.anyio
async def test_time(client: AsyncClient) -> None:
    response_time = await get_time(client)
    assert (response_time - datetime.now(tz=response_time.tzinfo)).total_seconds() < 0.5, \
        f'Wrong time: {response_time} != {datetime.now()}.'


@pytest.mark.anyio
async def test_time_changing(client: AsyncClient) -> None:
    response_time_first = await get_time(client)
    await asyncio.sleep(1)
    response_time_second = await get_time(client)

    # Test difference.
    assert 1.0 < (response_time_second - response_time_first).total_seconds() < 1.5, \
        f'Wrong time: {response_time_first} and {response_time_second}.'


@pytest.mark.anyio
async def test_time_timezone(client: AsyncClient) -> None:
    # UTC + 3.
    response_time_first = await get_time(client)
    assert response_time_first.utcoffset().total_seconds() == 10800.0, \
        f'Default timezone is not "Europe/Moscow": {response_time_first.tzinfo}.'

    response_time_second = await get_time(client, zone='Asia/Tokyo')
    assert response_time_second.utcoffset().total_seconds() == 32400.0, \
        f'Timezone mismatch: {response_time_second.tzinfo}.'

    # Even with timezone, time should be same.
    assert (response_time_second - datetime.now(tz=ZoneInfo('Asia/Tokyo'))).total_seconds() < 0.5, \
        f'Wrong time: {response_time_second} != {datetime.now()}.'


@pytest.mark.anyio
async def test_time_invalid_timezone(client: AsyncClient) -> None:
    response = await client.get('/v1/time', params={'zone': 'Asia/London'})
    assert response.status_code == status.HTTP_400_BAD_REQUEST, f'Invalid status code: {response.status_code}.'
    assert response.json().get('detail') == "'No time zone found with key Asia/London'", \
        f'Invalid message: {response.json()}.'
