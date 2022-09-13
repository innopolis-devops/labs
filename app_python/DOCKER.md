# Docker best practices used

## Avoid unnecessary privileges

* Container has it's own non-root user that runs the app
* Not make a specific UID a requirement to run the app

## Reduce attack surface

* Using trusted base images
* Only expose 1 unused port for the app

## Prevent confidential data leaks

* Use COPY over ADD as much as possible
* Create .dockerignore

## Layer sanity

* Place the commands that are less likely to change, and easier to cache, first.
* Grouping multiple commands together

## Running enviroment as non root

## Linting

* Use [Hadolint](https://github.com/hadolint/hadolint) for linting the docker file
* Use [Hadolint extension](https://marketplace.visualstudio.com/items?itemName=exiasr.hadolint) for vscode for ease of use
