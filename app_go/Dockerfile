FROM golang:1.16-alpine

ENV PROJECT_DIR "/app"
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY . $PROJECT_DIR

RUN useradd -m appuser
USER appuser

EXPOSE 3000
CMD [ "go", "run", "app.go" ]
