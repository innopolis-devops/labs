FROM python:3.10-alpine

WORKDIR /app
# Copying only necessary stuff
COPY src/* requirements.txt /app/
# Install reqs & use user to have rootless container
RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup && \
    pip install --no-cache-dir -r requirements.txt
USER appuser

EXPOSE 8000

# If necessary we may want to change parameters on launch
ENTRYPOINT [ "gunicorn", "app:app" ]
CMD [ "-b", "0.0.0.0:8000" ]