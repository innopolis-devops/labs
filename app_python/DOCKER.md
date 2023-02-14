# Best Docker practices

## Linting

I used [Hadolint](https://github.com/hadolint/hadolint) linter for Dockerfile.

## No root user

I created a user without root privileges and ran all commands under that user.

## .dockerignore

I used .dockerignore file to reduce build context.

## COPY vs. ADD

As it is suggested on Docker official [website](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#add-or-copy), I used `COPY` instead of ADD.

## Attack surface

I exposed only needed port in Dockerfile.

Moreover, I used Official Docker Image of Python (python:3.8.-slim-buster)

## Others

I mostly used absolute paths and `WORKDIR` as it is suggested in the same Docker guide.

