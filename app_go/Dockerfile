FROM golang:1.16-alpine

ENV PROJECT_DIR "/app"

RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR

COPY go.mod ./; \
     go.sum ./
RUN go mod download
COPY . $PROJECT_DIR


EXPOSE 3000
CMD [ "go", "run", "app.go" ]
