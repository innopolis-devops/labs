FROM alpine:latest AS build

# https://github.com/awslabs/amazon-ecr-credential-helper#installing
RUN apk add --no-cache libc6-compat gcc g++ git go && \
    go install github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest

# Final image has to be alpine, scratch doesn't support our env vars or credentials file.
FROM alpine:latest
COPY --from=containrrr/watchtower:1.4.0 / /
COPY --from=build /root/go/bin/docker-credential-ecr-login /bin/docker-credential-ecr-login

ENTRYPOINT ["/watchtower"]
