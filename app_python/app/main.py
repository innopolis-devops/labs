from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates
from datetime import datetime, timedelta
from pytz import timezone
from prometheus_fastapi_instrumentator import Instrumentator
from app.storage import Store

app = FastAPI()
store = Store()

@app.on_event("startup")
async def startup():
    Instrumentator().instrument(app).expose(app)

templates = Jinja2Templates(directory="templates")


@app.get("/")
async def return_time(request: Request):
    format = "%Y-%m-%dT%H:%M:%S"  # "2022-08-30T17:38:09.231036+04:00"
    current_time = datetime.now(timezone("Europe/Moscow")).strftime(format)

    current_time_formatted = format_time(current_time)

    store.add_visit(current_time_formatted)

    return templates.TemplateResponse(
        "time.html", {"request": request, "time": current_time_formatted}
    )

@app.get("/visits")
async def return_visits():
    return store.get_visits()

def format_time(time):
    components = str(time).split(" ")
    components.reverse()

    return " ".join(components)
