# CI

## Best practices

1. Use GitHub secrets. Personal access tokens or passwords are stored in a special storage, not in code.
2. Cache docker layers. This speeds up image building.
3. Run workflow only on changes to `app_python` directory (or the CI file itself).
4. Use environment variables to reduce duplication. For example, I put the name of my Docker Hub project into a separate variable to reuse it.