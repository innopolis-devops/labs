<p align="center">
<img src="./images/docker-logo.jpeg" width="200"/>
</p>

<br>

# 1. Docker Best practices

>Note: All the best practices followed are referred from [this blog](https://sysdig.com/blog/dockerfile-best-practices/).

- Use lightweight images based on alpine distribution
- Use docker layer caching. First install dependencies, then copy source code
- Support configuration of the container via environment variables
- Include .dockerignore for reducing docker context size
- Run binaries in containers under non-root users
- Make included binaries non-writable

# 2. Docker Linter

For linting the `dockerfile`, I used the available online tool for dockerfile linting called [ Dockerfile Linter](https://hadolint.github.io/hadolint/)