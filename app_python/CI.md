# CI best practices

1. Use timeouts for tasks
2. Never hardcode secrets
3. Use self-hosted runners only for private repos (no self-hosted runners since
   repo is public)
4. Use cache
5. Run tasks only if there are changes in app directory
