# Continuous Integration best practices

##Github Actions

- Keep the Actions (pipelines) minimal.
- Don't install unnecessary packages.
- Don't expose sensitive information or hardcode secrets.
- Cache the dependencies and results of expensive operations.
- Use a consistent version of the tools.
- Test on as many platforms as possible.
- Use an access key (stored in the repos secrets) instead of a password to access Docker.


## Jenkins

- Store the Jenkinsfile in version control.
- Perform linting and testing in parallel.
- Separate between the runner and the controller build nodes.
- _Same as GitHub Actions._
