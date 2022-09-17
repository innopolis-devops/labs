# Continuous Integration best practices

- Keep the Actions (pipelines) minimal.
- Don't install unnecessary packages.
- Don't expose sensitive information or hardcode secrets.
- Cache the dependencies and results of expensive operations.
- Use a consistent version of the tools.
- Test on as many platforms as possible.
- Use an access key (stored in the repo secrets) instead of a password to access Docker.
