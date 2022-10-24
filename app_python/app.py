from datetime import datetime

import pytz
from aiohttp import web
from loguru import logger
from middleware import setup_metrics

moscow_tz = pytz.timezone("Europe/Moscow")


async def get_time(_: web.Request) -> web.Response:
    t = datetime.now(moscow_tz).strftime("%H:%M:%S")
    logger.info("Time request")
    return web.Response(text=f"Time in Moscow is {t}")


async def health(_: web.Request) -> web.Response:
    logger.info("Health request")
    return web.Response(text="Up")


def make_app(app_name: str, up_metrics: bool):
    app = web.Application()
    if up_metrics:
        setup_metrics(app, app_name)
    app.add_routes([web.get("/", get_time)])
    app.add_routes([web.get("/health", health)])
    return app
