# Docker

## Best Practices

1. Avoid running containers as root.
2. Don’t bind to a specific UID.
3. Use distroless images, or build your own from scratch.
4. Update your images frequently.
5. Prefer `COPY` over `ADD`.
6. Reduce the number of layers, and order them intelligently.

## Linter Hadolint

[Hadolint](https://hadolint.github.io/hadolint/)

Pros:

- Simple to use
- A smarter Dockerfile linter
- Helps to build the best practice Docker images
