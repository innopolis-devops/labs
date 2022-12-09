# Time in Moscow

## Table of Contents
1. [Project description](#Project description)
2. [Quick start](#Quick start)
3. [Docker](#Docker)
4. [License](#License)
5. [Unit tests](#unit-tests)
6. [Git Actions CI](#git-actions-cI)

## Project description
This the app that shows current time in Moscow (GMT+3) and created using Flask framework


## Quick start
Clone the repo and run `main_app.py`. You maybe asked to open localhost using a certain port. For me, `http://127.0.0.1:5000`


##Docker
Build:
`docker build ./ -t kunurdaulet:latest`

Run:
`docker run --network="host" --name="kunurdaulet" kunurdaulet`

Run from docker hub:
`docker run --network="host" --name="kunurdaulet" kunurdaulet/devops-lab2:latest`

## Unit tests
Run application unit tests with:
```
pytest
```

## Git Actions CI
This repository uses Github Ci with 2 jobs:
- `Build_and_test` - builds, lints and tests the application
- `Docker_push` - logins and pushes app image to dockerhub

To test an image published through CI use:
```
docker pull kunurdaulet/moscowtime
docker run kunurdaulet/moscowtime
```

## License
Distributed under the MIT License