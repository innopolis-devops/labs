from fastapi import FastAPI, APIRouter

from app.api.api_v1.api import api_router
from app.core.config import settings
from app.api.api import router as root_router

from starlette_prometheus import metrics, PrometheusMiddleware

# root_router = APIRouter()
app = FastAPI(title="API")

app.include_router(api_router, prefix=settings.API_V1_STR)
app.include_router(root_router)

app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", metrics)

if __name__ == "__main__":
    # Use this for debugging purposes only
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8001, log_level="debug")
