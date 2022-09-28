# Docker

## Best practices

More suggestions can be found
[here](
    https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
).
It was decided to use the following best practices:

1. Exclude irrelevant files using `.dockerignore`
2. Install only required packages
3. Docker images better to produce containers that
requires minimum setup for rebuilding, replacing etc.
4. Do not allow containers to use root priviledges
5. Use linter for a Dockerfile.
For example, the [hadolint](https://github.com/hadolint/hadolint).
