FROM golang:1.16-alpine

ENV PROJECT_DIR "/app"

RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR

RUN go mod download
COPY . $PROJECT_DIR


EXPOSE 5000
CMD [ "go", "run", "app.go" ]
