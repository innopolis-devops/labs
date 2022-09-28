from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

from app.services import TimeService
from app.settings import settings, RunEnv

time_service: TimeService = TimeService(offset=0)

app = FastAPI()


@app.on_event("startup")
async def init_time_service():
    # Avoid reaching any servers while testing
    if settings.run_env == RunEnv.TEST:
        return

    global time_service
    time_service = TimeService.from_ntp("time.google.com")


@app.get("/", response_class=PlainTextResponse)
async def show_time():
    return (await time_service.get_real_time()).ctime()
