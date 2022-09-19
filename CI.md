# Continuous integration best practices (github actions)

* Never store secrets in hardcoded way. Use Github secrets

* Keep all actions minimal. Use alpine images in case of docker, drop useless actions, and so on

* If the job doesn't use dependency, do not install it

* Use metadata in github actions. It's easier to understand what's happening with action names, for example

* Never use self-hosted github runners in public repositories. There may be occure malicious commits in the repository

* Use build cache for optimization
