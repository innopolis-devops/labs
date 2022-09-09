FROM golang:1.19-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /go_server

EXPOSE 8080

ENV GIN_MODE release

CMD ["/go_server"]