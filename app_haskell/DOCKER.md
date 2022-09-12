# Docker best practices

1. Use rootless containers
2. Use trusted base images - official image of Haskell on DockerHub
3. COPY instead of ADD
4. Use multi-stage builds to reduce attack space and image space on disk
5. Use .dockerignore file
6. Place the commands that are less likely to change, and easier to cache, first
7. Linting - hadolint
