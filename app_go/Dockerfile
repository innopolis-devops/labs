# builder image
FROM golang:1.17-alpine3.16 as builder

WORKDIR /build

COPY . .

RUN go mod download;  \
    go mod verify;    \
    go build main.go

# run image
FROM alpine:3.11.3

WORKDIR /usr/src/app

COPY --from=builder /build/main .

ENV APP_USER=app
RUN adduser -S $APP_USER
USER $APP_USER

EXPOSE 8080

ENTRYPOINT [ "./main" ]