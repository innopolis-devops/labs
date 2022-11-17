FROM python:3.10-alpine

WORKDIR /app
COPY requirements /app/requirements
# Install reqs & use user to have rootless container
RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup && \
    mkdir persistent && touch persistent/visits.json && \
    chown appuser persistent/visits.json && \
    pip install --no-cache-dir -r /app/requirements/prod.txt
COPY src/* /app/
USER appuser

HEALTHCHECK --interval=1m --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/ || exit 1
  
EXPOSE 8000

# If necessary we may want to change parameters on launch
ENTRYPOINT [ "gunicorn", "app:app" ]
CMD [ "-b", "0.0.0.0:8000" ]