from fastapi import FastAPI
from starlette.responses import JSONResponse
from starlette.requests import Request as StarletteRequest

from app_python.errors import InvalidTimeZoneError
from app_python.use_case import CurrentTimeInTimeZoneUseCase


app = FastAPI()


@app.exception_handler(InvalidTimeZoneError)
async def on_invalid_id_error(_request: StarletteRequest, exc: InvalidTimeZoneError):
    return JSONResponse({"error_details": f"{exc}"}, status_code=400)


@app.get("/")
async def read_root() -> str:
    return await get_time_in("Europe/Moscow")


@app.get("/{iana_time_zone:path}")
async def get_time_in(iana_time_zone: str) -> str:
    use_case = CurrentTimeInTimeZoneUseCase(iana_time_zone)
    time = use_case.execute()
    return f"Current time in {iana_time_zone} is: {time}"
