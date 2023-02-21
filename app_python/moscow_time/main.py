from datetime import datetime

import requests
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi_health import health
from starlette_exporter import PrometheusMiddleware, handle_metrics

from .utils import current_visits, increment_visits


def is_healthy():
    return True


app = FastAPI()

app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", handle_metrics)


@app.get("/", response_class=HTMLResponse)
@increment_visits
async def get_moscow_time():
    background_image = "https://media.zicxa.com/3024446"

    style = '"background-image: url(%s); display: flex; justify-content: center; text-align: center; flex-direction: column; color: black; font-size: 30px;"'

    content = """
        <html>
            <head>
                <title>Moscow Time</title>
            </head>
            <body style=%s>
                <h1>Moscow time</h1>
                <h1> %s </h1>
            </body>
        </html>
    """

    error_content = """
        <html>
            <head>
                <title> Error </title>
            </head>
            <body style=%s>
                <h1> %s </h1>
            </body>
        </html>
    """

    response = requests.get("https://worldtimeapi.org/api/timezone/Europe/Moscow")

    if response.status_code == 200:
        date = datetime.strptime(response.json()["datetime"], "%Y-%m-%dT%H:%M:%S.%f%z")
        time = f"{date.hour}:{date.minute}:{date.second}"
        return HTMLResponse(
            content=content % (style % (background_image), time), status_code=200
        )
    else:
        error = f"Error: {response.status_code}"
        return HTMLResponse(
            content=error_content % (style % (background_image), error), status_code=404
        )


@app.get("/visits", response_class=HTMLResponse)
async def get_visits():
    return HTMLResponse(
        content=f"<h1>Visits: {await current_visits()}</h1>", status_code=200
    )


app.add_api_route("/health", health([is_healthy]))
