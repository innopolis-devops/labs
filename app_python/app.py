from datetime import datetime

import pytz
from aiohttp import web
from middleware import setup_metrics

moscow_tz = pytz.timezone("Europe/Moscow")


async def get_time(_: web.Request) -> web.Response:
    t = datetime.now(moscow_tz).strftime("%H:%M:%S")
    return web.Response(text=f"Time in Moscow is {t}")


def make_app(app_name: str):
    app = web.Application()
    setup_metrics(app, app_name)
    app.add_routes([web.get("/", get_time)])
    return app
