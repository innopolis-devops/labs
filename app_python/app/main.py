"""Server module."""
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi import Response
# pylint: disable=import-error
from view import html_response
# pylint: disable=import-error
from service import msk_time

app = FastAPI()


@app.get("/", response_class=HTMLResponse)
async def get_msk_time():
    """Get request for the main page"""
    zone = "Moscow"
    time = msk_time()
    return html_response(zone, time)


@app.get("/healthcheck")
async def healthcheck():
    """Get healthcheck"""
    return Response(content='{"status":"UP"}', media_type="application/json")
