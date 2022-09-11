# Docker best practices

- Keeping it simple
- Tag pythong image to avoid using latest tag.
- Used ```WORKDIR``` for clarity and reliability
- Explicitly marking used ports with ```EXPOSE```.
- Exclude the extra folder and files with ```.dockerignore```.
- Check it on linter such as [hadolint](https://hadolint.github.io/hadolint/)

## References

- https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
- https://hadolint.github.io/hadolint/
- https://snyk.io/blog/10-docker-image-security-best-practices/
