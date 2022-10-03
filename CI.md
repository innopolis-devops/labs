# Best practices for CI using GitHub Actions

1. Actions should be small. Actions’ virtual machines are pretty fast, however the longer an action takes to set up and
run, the more time developers spend waiting.
2. Don’t install unnecessary dependencies.
3. Avoid hardcode secrets. GitHub Actions provide with secrets, which automatically redact any secrets
that get logged on purpose or on accident.
4. Limit environment variables to the narrow scope, that means to be specific to the workflow, job or step.
5. Don’t use self-hosted runners in a public repository. The upside to use this is that Actions can run on machines can be more secure, performant, and optimized according to your needs. However, the downside is that if you’re working on a public Action, somebody could fork it and submit a pull request for a workflow containing malicious code.
6. Use certified Actions. Allow Uncertified Actions only Case by Case.