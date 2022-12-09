from datetime import datetime

import requests
from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()


@app.get("/", response_class=HTMLResponse)
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

    response = requests.get("http://worldtimeapi.org/api/timezone/Europe/Moscow")

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
