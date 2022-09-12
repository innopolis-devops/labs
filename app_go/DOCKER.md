# Used Docker's best practices for app_go

## Multi-stage building

Helps to decrease size of production container by moving build tools to
temporarily container for building.

## Privilege minimization

```dockerfile
RUN adduser -S $APP_USER
USER $APP_USER
```

The server is run under non-root user.

## Keeping images minimal

This is done by using **go-lang:alpine** image for building and **alpine** linux for running.

Also, I am using trustful official docker approved images. 

## Layer sanity

Grouping several run commands together.

```dockerfile
RUN go mod download;  \
    go mod verify;    \
    go build main.go
```

_Instead of_

```dockerfile
RUN go mod download
RUN go mod verify
RUN go build main.go
```

## Linting

Used tool - **[Hadolint](https://github.com/hadolint/hadolint)**

No issues were found.

## Using `.dockerignore` file

This increases leakage safety and helps to copy only required for production files.