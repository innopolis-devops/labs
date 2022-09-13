FROM python:3.10-slim

ENV PROJECT_DIR "/app"
ENV APP_USER "app"

RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY ./requirements.txt $PROJECT_DIR/requirements.txt

RUN python -m pip install --upgrade pip  && \
    pip install --no-cache-dir -r $PROJECT_DIR/requirements.txt

COPY . $PROJECT_DIR

RUN useradd -m appuser
USER appuser

EXPOSE 5000
CMD [ "flask", "run", "--host=0.0.0.0", "--port=5000" ]
