## Best practices

Those are the ones I consider important as well as the ones suggested by the [mentioned article](https://sysdig.com/blog/dockerfile-best-practices/)

1. Using `docker-compose`
2. Using official and trusted base image
3. Avoiding running container by root
4. Avoiding giving a broad scope of permissions to the user
6. Avoiding using `ADD` statement where more explicit `COPY` would work
7. Avoiding giving the image a broad context via `.dockerignore`
8. Avoiding copying unnecessary files to the container (I do it explicitly: i.e., `COPY /server server`)
9. Layering the Dockerfile in the way we could benefit from layers' caching
10. Linting the Dockerfile with `hadolint`, and following its suggestions

## Linters

I used only the well-known `hadolint/hadolint` linter.
For the sake of simplicity, I only installed it locally, so you would not see in project dependencies.
However, the Dockerfile is linted, and the tool helped me to get rid of some potential vulnerabilities

Reference: https://github.com/hadolint/hadolint
