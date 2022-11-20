from datetime import datetime, timezone, timedelta
import os
from fastapi import FastAPI, Request
from fastapi.responses import PlainTextResponse
from starlette_prometheus import metrics, PrometheusMiddleware


app = FastAPI()
app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", metrics)
log_filename = os.getenv("LOG_FILE", "data/visits.log")
os.makedirs(os.path.dirname(log_filename), exist_ok=True)


def log_user(req: Request):
    with open(log_filename, "a+") as f:
        f.write((req.client.host if req.client is not None else "unknown") + "\n")


@app.get("/", response_class=PlainTextResponse)
def get_time(req: Request):
    """
    Returns Moscow time
    """
    log_user(req)
    offset = timedelta(hours=3)
    return datetime.now(tz=timezone(offset)).strftime("%d-%m-%Y %H:%M:%S MSC")


@app.get("/visits", response_class=PlainTextResponse)
def get_visits():
    """
    Returns IP addresses of all visitors
    """
    with open(log_filename, "r") as f:
        return "".join(f.readlines())
