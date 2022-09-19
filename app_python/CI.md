# Used CI Best Practices for app_python

Here is the list:

- Separate testing code and building docker image into different jobs to isolate them
- Docker image is not built unless code is tested and checked
- Do not trigger CI on changing documentation files
- Use caching for dependencies
- Use build-cache for docker
- Use GitHub secrets for storing tokens
- Store important test logs into artifact
- Linting before testing (easier to check codestyle than testing, so that saving time and resources)