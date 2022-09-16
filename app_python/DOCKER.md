# Used Docker best practices

- Running app as a non-root user
- Readonly filesystem
- Using [official Python image](https://hub.docker.com/_/python)
- Added [.dockerignore](./.dockerignore) to avoid passing unneeded things to Docker
- Layers are sorted for better caching, and combined where applicable
- [Dockerfile](./Dockerfile) is linted using [hadolint](https://github.com/hadolint/hadolint)

*Multi-stage build* does not really make sense here, since the app is run without the need to build anything.
