from fastapi import FastAPI, Response
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import requests
import datetime
from starlette_prometheus import metrics, PrometheusMiddleware

app = FastAPI()
app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", metrics)


class MSK_time(BaseModel):
    msk_time: str


class Message(BaseModel):
    message: str


@app.get("/",
         summary="Get moscow time",
         response_model=MSK_time,
         responses={
             500: {"model": Message, "description": "Shows error message"},
             200: {
                 "description": "Current moscow time",
                 "content": {
                     "application/json": {
                         "example": {"msk_time": "17:24:01 04.09.2022"}
                         }
                     },
                 },
             },
         )
async def root(response: Response):
    try:
        url = "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Moscow"
        r = requests.get(url)
    except Exception:
        return JSONResponse(
                status_code=500,
                content={"message": "Failed to connect to timeapi.io!"}
                )
    if r.status_code == 200:
        time_obj = r.json()
        time = datetime.datetime(time_obj["year"],
                                 time_obj["month"],
                                 time_obj["day"],
                                 hour=time_obj["hour"],
                                 minute=time_obj["minute"],
                                 second=time_obj["seconds"])
        return MSK_time(msk_time=time.strftime("%H:%M:%S %d.%m.%Y"))
    else:
        return JSONResponse(
                status_code=500,
                content={"message": "Failed to get time with timeapi.io!"}
                )
