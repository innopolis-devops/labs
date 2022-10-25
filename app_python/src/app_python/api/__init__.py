from fastapi import FastAPI
from fastapi.responses import ORJSONResponse
from fastapi.middleware.cors import CORSMiddleware
from prometheus_fastapi_instrumentator import Instrumentator

from app_python import settings

app = FastAPI(
    title='PythonApp',
    version='1.0.0',
    root_path=settings.root_path if settings.root_path is not None else '',
    default_response_class=ORJSONResponse,
    description='The API is organized around REST. Our API has predictable resource-oriented URLs, returns '
                'JSON-encoded responses, and uses standard HTTP response codes',
    contact={'name': 'Ivan Izmailov', 'url': 'https://smthngslv.t.me/', 'email': 'smthngslv@gmail.com'}
)

# Allow CORS.
app.add_middleware(
    CORSMiddleware, allow_credentials=True, allow_origins=['*'], allow_methods=['*'], allow_headers=['*']
)

# Include exceptions handlers.
import app_python.api.exceptions

# Include views.
from app_python.api.views import router

app.include_router(router, prefix='/v1')


@app.on_event('startup')
async def startup():
    Instrumentator().instrument(app).expose(app)
