from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates
from WorldTimeAPI import service
from datetime import datetime, timedelta
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

@app.on_event("startup")
async def startup():
    Instrumentator().instrument(app).expose(app)

templates = Jinja2Templates(directory="templates")
time_client = service.Client("timezone")


@app.get("/")
async def return_time(request: Request):
    request = {"area": "Europe", "location": "Samara"}
    response = time_client.get(**request)

    format = "%Y-%m-%dT%H:%M:%S"  # "2022-08-30T17:38:09.231036+04:00"
    current_time = datetime.strptime(response.datetime.split(".")[0], format)

    msc_time = current_time - timedelta(hours=1)

    return templates.TemplateResponse(
        "time.html", {"request": request, "time": format_time(msc_time)}
    )


def format_time(time):
    components = str(time).split(" ")
    components.reverse()

    return " ".join(components)
