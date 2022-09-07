FROM python:3.10-slim

WORKDIR /app
# Copying only necessary stuff
COPY src/* requirements.txt /app/
# Install reqs & use user to have rootless container
RUN pip install -r requirements.txt && \
    useradd webserver_user && \
    chown webserver_user /app
USER webserver_user

EXPOSE 8000

# If necessary we may want to change parameters on launch
ENTRYPOINT [ "gunicorn", "app:app" ]
CMD [ "-b", "0.0.0.0:8000" ]