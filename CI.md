# CI/CD best practices

1. Build only once. Do not make different builds for different environments as it can lead to inconsistencies.
2. Separate builds into logical steps. Avoid running them all in parallel - tests should not run if linting fails.
3. Add build cache.
4. Do not hardcode secrets, prevent them leaking into repository at all.
5. Use default build times so that an actions does not run for long in case of a problem.
6. Run actions for changes in relevant files - no need to rerun the whole pipeline for a README update.
7. Run some actions only on PRs to relevant branches so that large actions do not run on each small commit.
8. Use precommit hooks so that some basic checks are run before user pushes problematic code (somewhat mitigated with dependant steps, but still trashes the commit history).