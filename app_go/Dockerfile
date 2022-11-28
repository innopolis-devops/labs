FROM golang:1.17-alpine3.16
FROM alpine:3.11.3

ENV PROJECT_DIR "/app"
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY . $PROJECT_DIR

RUN go mod tidy && \
    go get github.com/prometheus/client_golang/prometheus/promhttp

RUN adduser -S userapp && \
    mkdir /app/persistent && \
    touch /app/persistent/visits.json && \
    chown userapp /app/persistent/visits.json

USER userapp

EXPOSE 2222
ENTRYPOINT [ "go", "run", "app.go" ]
