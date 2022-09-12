# DOCKERFILE Best practices used

## Rootless containers

1. There are very few use cases where the container needs to execute as root,
   so don’t forget to include the USER instruction to change the default
   effective UID to a non-root user.

1. Don’t bind to a specific UID
Run the container as a non-root user, but don’t make that user UID a requirement.

## Linting

1. Linter -
   [Haskell Dockerfile Linter (hadolint)](<https://github.com/hadolint/hadolint>)

1. Layout sanity - Since RUN, COPY, ADD, and other instructions will create
    a new container layer, grouping multiple commands together will reduce
    the number of layers.

## .dockerignore

1. Used dockerignore for skipping unnecessary files
