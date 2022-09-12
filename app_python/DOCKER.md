# Docker

## Best Practices

1. Use trusted base images.
2. Expose only the ports that your application needs.
3. Use `COPY` instead of `ADD` (`COPY` is more explicit).
4. Build context and `.dockerignore`.
5. Use `docker-compose` for simple run.

## Linter

I used `hadolint` as a linter for Docker files. 
[Linter link](https://github.com/hadolint/hadolint).