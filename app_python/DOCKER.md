# Work with Docker

## Best practices applied

Best practices were retrieved from <https://sysdig.com/blog/dockerfile-best-practices/>

1. Use the minimal required base container
2. Use trusted base images
3. COPY instead of ADD
4. Use Dockerignore
5. Place the commands that are less likely to change, and easier to cache, first.
6. Linting - hadolint
7. Run as non root
8. Include health checks

I tried to use multi staged build but the result was worse than original one.

The multi staged Dockerfile is available

## Linter for Dockerfile

In the project [Hadolint](https://github.com/hadolint/hadolint) linter was used.

`` $ docker run --rm -i hadolint/hadolint < Dockerfile ``
