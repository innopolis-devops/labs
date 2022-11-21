# syntax=docker/dockerfile:1

FROM python:3.10-slim AS compile-image

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt


FROM python:3.10-slim AS build-image

EXPOSE 8000

RUN useradd --create-home appuser
RUN mkdir /home/appuser/volume
RUN chown appuser:appuser /home/appuser/volume
USER appuser

COPY --from=compile-image --chown=appuser /opt/venv /opt/venv
COPY --chown=appuser moscow_time/ /home/appuser

WORKDIR /home/appuser

ENV PATH="/opt/venv/bin:$PATH"
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
