# CI Best practices

Some best practices were taken from: [link](https://www.datree.io/resources/github-actions-best-practices)

* **Keep your Actions minimal** - The action with setting dependencies, running linters and tests is very quick and takes only 1 minute. Unfortunately the cross-platform build of the docker images for the three systems cannot be split into parts or executed faster, so it takes 50 minutes.
* **Don’t install dependencies unnecessarily** - I need all dependencies I install
* **Never hardcode secrets** - I use Github secrets to store my secrets. No hardcode
* **Don’t use self-hosted runners in a public repository** - I do not
* **Running the required pipeline depending on the modified files**
* **Use docker cache to speed up pipeline** - I use a cache for the cross-platform docker building pipeline, which runs for 50 minutes without cache, but only 2 with cache (if it was run before and program do not have significant changes)

* **Use github badges**