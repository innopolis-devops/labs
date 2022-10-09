from fastapi import FastAPI
from fastapi_health import health
from starlette_exporter import PrometheusMiddleware, handle_metrics

from .router import router

app = FastAPI()
app.include_router(router)

# Metrics
app.add_middleware(PrometheusMiddleware)
app.add_route('/metrics', handle_metrics)


# Healthcheck
def is_healthy() -> bool:
    return True  # i.e., healthy if can be accessed by the /health route


app.add_api_route('/health', health([is_healthy]))
