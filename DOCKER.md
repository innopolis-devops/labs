# Docker implementation

## Best practices used for Dockerfiles

- Running apps as a non-root user
- Readonly filesystem, if possible
- Using [official Python image](https://hub.docker.com/_/python), as well as the [Node image](https://hub.docker.com/_/node) for Typescript app
- Added `.dockerignore` to both application folders avoid passing unneeded things to Docker
- Layers are sorted for better caching, and combined where applicable
- `Dockerfile`s are linted using [hadolint](https://github.com/hadolint/hadolint)
- Using _multi-stage builds_ for both applications
