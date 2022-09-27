# Continuous integration best practices

## Used ones

- Use github secrets instead of writing tokens manually.
- Specify timeouts for each workflow.
- Avoid unneccessary dependencies.
- Split workflows into logical stages. For instance, for linting, testing and pushing to dockerhub.
- Specify dependencies for logical stages.
