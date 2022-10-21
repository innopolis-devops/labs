FROM golang:1.16-alpine

ENV PROJECT_DIR "/app"
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY . $PROJECT_DIR

RUN adduser -S userapp
USER userapp

EXPOSE 2222
CMD [ "go", "run", "app.go" ]
