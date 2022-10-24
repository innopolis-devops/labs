# Github actions best practices

* Consider if (third-party) actions are really needed (Don’t install dependencies unnecessarily.)
* Never hardcode secrets. ou can securely store secrets inside your repository’s settings, and then provide them as inputs or environment variables to your Actions at any time.
* Keep your Actions minimal. Actions’ virtual machines have high bandwidth and are reasonably fast, but the longer an action takes to set up and run, the more time you spend waiting.
* Limit environment variables to the narrowest possible scope. Accordingly, the best practice here is to prevent polluting the global environment context as much as possible by always declaring environment variables with the narrowest possible scope.
* Don’t use self-hosted runners in a public repository/
