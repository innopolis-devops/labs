# Best practices for writing CI using GitHub Actions

1. Keep your Actions minimal. Actions’ virtual machines have high bandwidth and are reasonably fast, but the longer an action takes to set up and run, the more time you spend waiting.
2. Don’t install dependencies unnecessarily. Avoid installing dependencies where you can.
3. Never hardcode secrets.
4. Limit environment variables to the narrowest possible scope.
5. Store authors in Action metadata to promote code ownership
6. Don’t use self-hosted runners in a public repository

## Reference list

* <https://www.datree.io/resources/github-actions-best-practices>
