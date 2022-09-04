"""Server module."""
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from view import html_response
from service import msk_time

app = FastAPI()


@app.get("/", response_class=HTMLResponse)
async def read_items():
    """Get request for the main page"""
    zone = "Moscow"
    time = msk_time()
    return html_response(zone, time)
