"""Server module."""
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi_healthcheck import HealthCheckFactory, healthCheckRoute
from starlette_prometheus import metrics, PrometheusMiddleware
# pylint: disable=import-error
from view import html_response
# pylint: disable=import-error
from service import msk_time

app = FastAPI()
_healthChecks = HealthCheckFactory()
app.add_api_route('/healthcheck', endpoint=healthCheckRoute(factory=_healthChecks))
app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", metrics)


@app.get("/", response_class=HTMLResponse)
async def get_msk_time():
    """Get request for the main page"""
    zone = "Moscow"
    time = msk_time()
    return html_response(zone, time)
