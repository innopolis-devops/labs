FROM python:3.10-slim

ENV LANG=en_US.UTF-8
ENV TZ=Europe/Moscow
ENV PROJECT_DIR "/app"

RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY . $PROJECT_DIR

RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD [ "flask", "run", "--host=0.0.0.0", "--port=5000" ]
