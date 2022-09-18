## Best practices

1. Using only trusted actions
2. Using Snyk to check Python dependencies for vulnerabilities
3. Using environmental variables (hiding secrets, etc.)
4. Using timeout for the jobs (so that the jobs would not stick)
5. Using custom CI triggers (only push to ./app_python/**)
6. Caching the dependencies (2.5 times faster)
7. Installing only necessary dependencies
8. Specifying concrete action version tags
