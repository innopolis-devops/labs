"""This module provides a FastAPI web server that shows current time in Moscow (MSK)"""

from datetime import datetime
import datetime as dt

from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse
import uvicorn
from dotenv import dotenv_values


def get_application() -> FastAPI:
    return FastAPI(title = __name__)

offset = dt.timedelta(hours=3)
tz = dt.timezone(offset, name="MSK")

app = get_application()


def get_datetime() -> str:
    """get current time as a formatted string

    Returns:
       str : formatted time
    """
    return str(datetime.now(tz=tz).strftime("%H:%M:%S"))



templates = Jinja2Templates(directory="app/templates")


@app.get("/", response_class=HTMLResponse)
async def root(request: Request):
    """GET / to show current MSK time

    Args:
        request (Request): dummy request

    Returns:
       Any : some template HTML response
    """
    return templates.TemplateResponse(
        "index.jinja", {"request": request, "time_msk": get_datetime()}
    )


CONFIG = dotenv_values(dotenv_path="app.env")


def main():
    uvicorn.run(app, host=CONFIG["HOST"], port=int(CONFIG["PORT"]))


if __name__ == "__main__":
    main()
