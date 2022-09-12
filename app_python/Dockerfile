FROM python:3.10-slim

ENV LANG en_US.UTF-8
ENV TZ=Europe/Moscow
ENV PROJECT_DIR "/app"

RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR

RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r $PROJECT_DIR/requirements.txt

COPY . $PROJECT_DIR

CMD [ "python", "app.py" ]
