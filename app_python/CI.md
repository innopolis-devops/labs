# CI Best practices

Best practices taken from: [link](https://www.datree.io/resources/github-actions-best-practices)

* **Keep your Actions minimal** - The action with setting dependencies, running linters and tests is very quick and takes only 1 minute. Unfortunately the cross-platform build of the docker images for the three systems cannot be split into parts or executed faster, so it takes 50 minutes.
* **Don’t install dependencies unnecessarily** - I need all dependencies I install
* **Never hardcode secrets** - I use Github secrets to store my secrets. No hardcode
* **Store authors in Action metadata to promote code ownership** - I add my name in action metadata
* **Don’t use self-hosted runners in a public repository** - I do not