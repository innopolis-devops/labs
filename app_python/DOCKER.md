## Best practices

- I use the minimal required base container `python:3`. Previously checked it on  `https://hub.docker.com/_/python` images
- I use official and trusted images. In my case `python:3`
-  Reduce base image. I use `python:3` image as a base instead of (e.g.) `ubuntu`.
- I use only needed exposed ports. 
- I use  Credentials and confidentiality principle. I do not put any secret or credentials in the Dockerfile
- I prefer to use `COPY` command over `ADD`
- I use Use multi-stage builds
- I use linter for Dockerfile

## Linter
I use online linter `https://hadolint.github.io/hadolint/`