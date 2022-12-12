from fastapi import FastAPI, Request
from datetime import datetime
import pytz
import os
from starlette_prometheus import metrics, PrometheusMiddleware

fast_api = FastAPI()


fast_api.add_middleware(PrometheusMiddleware)
fast_api.add_route("/metrics", metrics)


@fast_api.get("/")
def time_server(request: Request):
    current_time = datetime.now(pytz.timezone('Europe/Moscow'))
    format_string = "Today is %d/%m/%Y! Time is %H:%M:%S, have a nice day :)"

    if not os.path.exists('/home/app/data/visits.txt'):
        print('Visits file not found')
        return current_time.strftime(format_string)

    with open("/home/app/data/visits.txt", "a+") as f:
        f.write(
            f"{current_time.isoformat(timespec='seconds')} - {request.client.host}\n")
    return current_time.strftime(format_string)


@fast_api.get('/visits')
def visits():
    visits_data = "Visits:\n"
    try:
        with open("/home/app/data/visits.txt", "r") as fo:
            file_text = fo.read()
            visits_data += f"{file_text}"
    except FileNotFoundError:
        pass

    return visits_data
