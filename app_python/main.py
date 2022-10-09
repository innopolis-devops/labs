from datetime import datetime, timezone, timedelta
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from starlette_prometheus import metrics, PrometheusMiddleware


app = FastAPI()
app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", metrics)


@app.get("/", response_class=PlainTextResponse)
def get_time():
    """
    Returns Moscow time
    """
    offset = timedelta(hours=3)
    return datetime.now(tz=timezone(offset)).strftime("%d-%m-%Y %H:%M:%S MSC")
