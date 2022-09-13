# Docker

## Best practices

1. I've used `EXPOSE` to directly specify the port via which the app communicates

2. I've created a non-root user `timeapp`

3. I've put all sourcecode in folder `app` to remove unnecessary flies from image

4. I  copy `requirements.txt` first to use cached version if requirements are not changed

## Linter

I've used `hadolint]` and formatted Dockerfile using this tool.