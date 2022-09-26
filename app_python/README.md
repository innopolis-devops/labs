# DevOps Lab #1
Simple python web app that allows to get current time.

# CI/CD
![Build Status](https://github.com/smthngslv/iu-devops-labs/actions/workflows/python.yml/badge.svg)
1. On every push lint and test are run.
2. On every pull request docker image are build but not pushed, additionally to lint and test.
3. When merge request it merged to `master` branch, docker image are published to AWS ECR.

# Overview.
1. Build it via
```shell
make build-dev
```

2. Run it via
```shell
make local
```

3. Go to `http://localhost/docs`. Use `admin` as login and password.

# Contact
If you have any questions just ask them here --> https://smthngslv.t.me


# Makefile commands

1. You can edit values in the variable section in the Makefile:
```shell
###--VARIABLES--########################################################################################################

AWS_ACCOUNT=553667903818
AWS_REPOSITORIES_REGION=eu-north-1

SERVICE_NAME=app_python
CONTAINERS=api watchtower

########################################################################################################################
```

Variable `AWS_ACCOUNT` should be changed only if we are migrating to the new AWS account. Variable 
`AWS_REPOSITORIES_REGION` indicates region of `ECR` repositories for containers. You should modify `SERVICE_NAME`
according to the name of the service you are developing right now. And the `CONTAINERS` variables stores all containers
if the format `container-1 container-2 container-3`.

2. At the very first time you need to initialize (create) `ECR` repositories. To that run following commands:
```shell
make ecr_init
```

This will create repositories for all your containers with names like `SERVICE_NAME/CONTAINER_NAME`.

3. You can use linters to check your code quality:
```shell
make lint
```

4. To reformat code according to linters style, simply run:
```shell
make refactor
```

5. To build, push and pull containers use `make` with `build-STAGE`/`push-STAGE`/`pull-STAGE` commands. You may need to login into
aws ecr via `make ecr_login`. There are two stages - `dev` and `prod`:
```shell
make ecr_login
make pull-dev
make build-dev
make push-dev
```

6. You can clean docker cache and volumes with help of the following commands respectively:
```shell
make prune
make prune-v
```

7. To start the service locally use `make STAGE-local`. This will download credentials and start service locally. You
can change environment variables in `.env.priority`. To be able to specify namespace for environment variables use
NAMESPACE argument.
```shell
make dev-local
NAMESPACE=opensea make dev-local
```

You can also start service without downloading variables from AWS. Just use `make local`. This will use `dev` as tag.

8. In order to start service in the server use `make STAGE`. There are two stages - `dev` and `prod` To be able to 
specify namespace for environment variables use NAMESPACE argument:
```shell
make dev
NAMESPACE=innopolis make dev
```

9. You can stop or down your services with `make` and `stop`/`down`/`down-v`. The `down-v` command will also delete all
volumes of the service.
```shell
make stop
make down-v
```

10. You can download environment variables via `TAG=STAGE make env`. There are two stages - `dev` and `prod` To be able 
to specify namespace for environment variables use NAMESPACE argument.
```shell
TAG=dev make env
TAG=dev NAMESPACE=innopolis make env
```

11. Unit tests.
```shell
make test
```
