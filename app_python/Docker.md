# Docker best practices

- Keeping it simple
- Tag pythong image to avoid using latest tag.
- USing a slim Python image given that we don't need the fully blown Python image.
- Used ```WORKDIR``` for clarity and reliability
- Used ```USER``` to change to a non-root user, so service can be run without privileges
- Explicitly marking used ports with EXPOSE.
- Check it on linter such as [hadolint](https://hadolint.github.io/hadolint/)

## References

- https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
- https://hadolint.github.io/hadolint/
- https://snyk.io/blog/10-docker-image-security-best-practices/
