#  CI best practices GitHub

1. Keep your Actions minimal, because Actions’ virtual machines have high bandwidth and are reasonably fast.
2. Don’t install unnecessary dependencies.
3. Never hardcode secrets. Use GitHub Actions Secrets
4. Limit environment variables to the narrowest possible scope. Be specific to the workflow, job or step.
