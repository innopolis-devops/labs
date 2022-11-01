import pytest
from httpx import AsyncClient
from starlette import status


@pytest.mark.anyio
async def test_system_status(client: AsyncClient) -> None:
    response = await client.get('/v1/system/status')
    assert response.status_code == status.HTTP_200_OK, f'Invalid response code: {response.status_code}.'
    assert response.json() == {'status': 'OK'}, f'Invalid response body: {response.json()}.'


@pytest.mark.anyio
async def test_not_exist(client: AsyncClient) -> None:
    response = await client.get('/v1/not/exist')
    assert response.status_code == status.HTTP_404_NOT_FOUND, f'Invalid response code: {response.status_code}.'
    assert response.json().get('detail') == 'Not Found', f'Invalid message: {response.json()}.'
