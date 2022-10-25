from uuid import uuid4
from logging import getLogger
from zoneinfo import ZoneInfoNotFoundError

from fastapi import status
from pydantic import ValidationError
from fastapi.responses import ORJSONResponse

from app_python.api import app
from app_python.api.schemas import APIHTTPError

logger = getLogger('gunicorn.error')


@app.exception_handler(Exception)
async def http_exception_handler(_, exception: Exception) -> ORJSONResponse:
    id_ = uuid4()
    logger.exception(f'Invalid request {id_}:', exc_info=exception)
    return ORJSONResponse(
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
        content=APIHTTPError(detail='Internal server error.', request_id=id_).dict()
    )


@app.exception_handler(ValidationError)
async def validation_exception_handler(_, exception: ValidationError) -> ORJSONResponse:
    id_ = uuid4()
    logger.exception(f'Invalid request {id_}:', exc_info=exception)
    return ORJSONResponse(
        status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
        content=APIHTTPError(detail=str(exception.errors()), request_id=id_).dict()
    )


@app.exception_handler(ZoneInfoNotFoundError)
async def bad_zone_exception_handler(_, exception: ZoneInfoNotFoundError) -> ORJSONResponse:
    id_ = uuid4()
    logger.exception(f'Invalid request {id_}:', exc_info=exception)
    return ORJSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST,
        content=APIHTTPError(detail=str(exception), request_id=id_).dict()
    )
