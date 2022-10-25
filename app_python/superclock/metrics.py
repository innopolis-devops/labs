from typing import Callable

from prometheus_client import Counter
from prometheus_fastapi_instrumentator.metrics import Info


# Modified example from https://github.com/trallnag/prometheus-fastapi-instrumentator
def http_requested_languages_total() -> Callable[[Info], None]:  # pragma: no cover
    METRIC = Counter(
        "http_requested_languages_total",
        "Number of times a certain language has been requested.",
        labelnames=("langs",),
    )

    def instrumentation(info: Info) -> None:  # Analyze all incoming requests
        lang_str = info.request.headers.get("Accept-Language", "")
        langs = {e.split(";")[0].strip().lower() for e in lang_str.split(",")}
        for language in langs:
            METRIC.labels(language).inc()

    return instrumentation
