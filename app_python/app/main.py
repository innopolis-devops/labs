"""Server module."""
import json
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi import Response
# pylint: disable=import-error
from starlette_prometheus import metrics, PrometheusMiddleware
# pylint: disable=import-error
from view import html_response
# pylint: disable=import-error
from service import msk_time

app = FastAPI()
app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", metrics)


@app.get("/", response_class=HTMLResponse)
async def get_msk_time():
    """Get request for the main page"""
    zone = "Moscow"
    time = msk_time()
    with open('data/visits.json', encoding="utf-8") as json_file:
        data = json.load(json_file)
        data['total_number'] = int(data['total_number']) + 1
        visit_times = data['visits']
        visit_times.append(time)
        data['visits'] = visit_times
        json_string = json.dumps(data)
        with open('data/visits.json', 'w', encoding="utf-8") as outfile:
            outfile.write(json_string)
    return html_response(zone, time)


@app.get("/healthcheck")
async def healthcheck():
    """Get healthcheck"""
    return Response(content='{"status":"UP"}', media_type="application/json")


@app.get("/visits")
async def visits():
    """Get visits"""
    with open('data/visits.json', encoding="utf-8") as json_file:
        json_string = json.dumps(json.load(json_file))
        return Response(content=json_string, media_type="application/json")
