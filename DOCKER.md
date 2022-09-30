# Best practices used for Dockerfiles

## Linter

I have used <https://hadolint.github.io/hadolint/> to lint my Dockerfiles.

## Non-root user

I have created non-root user for running flutter build, since Google reccomends to run flutter build as non-root user. Also it is recommended to run docker as non-root user when possible.

### Multiple Stages

I am using stages for my flutter project (build and run). I have decided against using separate stages in the python project for the sake of simplicity.

## Security

I am using official images, or building/downloading files from official sources. I am not exposing redundant ports and keeping source files separate from run environment in the flutter project's Dockerfile.


## .dockerignore

I am using .dockerignore to exclude unnecessary files from the container.
