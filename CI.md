# CI details

## Best practices used

- Timeouts for workflows (5 minutes for all)
- Only trusted third-party actions used (Docker and Snyk)
- GitHub tokens in Actions are restricted to read-only access
- Concurrency groups are defined in each action
- Only required action triggers are used (except Docker image pushing, which can be done manually, if needed)
