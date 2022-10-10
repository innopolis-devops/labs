import time

import prometheus_client
from aiohttp import web
from prometheus_client import CONTENT_TYPE_LATEST, Counter, Gauge, Histogram


def prom_middleware(app_name: str):
    async def factory(_, handler):
        async def middleware_handler(request):
            try:
                request["start_time"] = time.time()
                request.app["requests_total"].labels(
                    app_name, request.method, request.path
                ).inc()
                request.app["requests_in_progress_total"].labels(
                    app_name, request.path, request.method
                ).inc()
                response = await handler(request)
                resp_time = time.time() - request["start_time"]
                request.app["request_latency_seconds"].labels(
                    app_name, request.path
                ).observe(resp_time)
                request.app["requests_in_progress_total"].labels(
                    app_name, request.path, request.method
                ).dec()
                return response
            except Exception as e:
                raise e

        return middleware_handler

    return factory


async def metrics(_) -> web.Response:
    resp = web.Response(body=prometheus_client.generate_latest())
    resp.content_type = CONTENT_TYPE_LATEST
    return resp


def setup_metrics(app: web.Application, app_name: str) -> None:
    app["requests_total"] = Counter(
        "requests_total",
        "Total Request Count",
        ["app_name", "method", "endpoint"],
    )

    app["request_latency_seconds"] = Histogram(
        "request_latency_seconds",
        "Request latency",
        ["app_name", "endpoint"],
    )

    app["requests_in_progress_total"] = Gauge(
        "requests_in_progress_total",
        "Requests in progress",
        ["app_name", "endpoint", "method"],
    )

    app.middlewares.insert(0, prom_middleware(app_name))
    app.router.add_get("/metrics", metrics)
