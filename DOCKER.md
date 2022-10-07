# Docker

## Best practices used

- [x] [Use .dockerignore](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#exclude-with-dockerignore) files

- [x] [Use multi-stage builds](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#use-multi-stage-builds)
  - There are several stages:
    - Install system dependencies
    - Install project-specific packages
    - Build an app
    - Run the server

- [x] [Don't install unnecessary packages](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#dont-install-unnecessary-packages)
  - I didn't include a text editor in a database image.

- [x] [Leverage build cache](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#leverage-build-cache)
  - to cache layers, we need to copy the most volatile files into the image as late as possible
  - also described [here](https://fastapi.tiangolo.com/deployment/docker/#docker-cache)

- [x] [Dockerfile instructions](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#dockerfile-instructions)
  - In both apps' Dockerfiles:
    - used the base images via [FROM](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#from)
    - introduced env variables via [ENV](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#env)
    - exposed ports via [EXPOSE](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#expose)
    - created an [ENTRYPOINT](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint) to set the default command in [exec](https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example) form
    - And left its args in the overridable `CMD`

- [x] Followed 12-factor-app [guide](https://12factor.net/dev-prod-parity)
  - Each server reads from its [dotenv](https://hexdocs.pm/dotenvy/dotenv-file-format.html) files (`.env`)

- [x] Used [heredocs](https://www.docker.com/blog/introduction-to-heredocs-in-dockerfiles/) in `Dockerfiles` to ease reading multiline commands

- [x] Used [hadolint](https://github.com/hadolint/hadolint) to lint the Docker files

## Available Commands and Tasks

See the [docs](./README/docs.md)
