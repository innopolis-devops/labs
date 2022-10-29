from aioredis import Redis
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from prometheus_fastapi_instrumentator import Instrumentator

from app.models import Status
from app.services import TimeService
from app.services.status import StatusService
from app.settings import settings, RunEnv

time_service: TimeService = TimeService(offset=0)
status_service: StatusService = StatusService()

app = FastAPI()


@app.on_event("startup")
async def init_time_service():
    Instrumentator().instrument(app).expose(app)

    # Avoid reaching any servers while testing
    if settings.run_env == RunEnv.TEST:
        return

    global time_service, status_service
    time_service = TimeService.from_ntp(settings.ntp_server)
    status_service = StatusService(
        db=Redis(host=settings.redis_host, port=settings.redis_port)
    )


@app.get("/", response_class=PlainTextResponse)
async def show_time():
    await status_service.log_request()
    return (await time_service.get_real_time()).ctime()


@app.get("/status")
async def status() -> Status:
    return await status_service.get_status()
