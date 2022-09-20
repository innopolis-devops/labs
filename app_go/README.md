
# Moscow Time Web Application

![](https://img.shields.io/github/workflow/status/Ilya-Kolomin/DevOps/GO_APP_CI?style=for-the-badge)

## About The Project

This is a simple web application that shows current time in Moscow.\
_Note_: the time updates only when page refreshes.

![](https://i.imgur.com/Uhka5Fu.gif)

### Built With

* ![](https://img.shields.io/badge/golang-1.17.6-blue?style=for-the-badge&logo=go)
* ![](https://img.shields.io/badge/gin-1.8.1-blue?style=for-the-badge&logo=gin)

## Getting Started

This is a small guide how to prepare and install my project in two ways: manual and using docker.

## Manual

#### Prerequisites

First of all you will need Go compiler. I will recommend to
install the latest one or 1.17.6 version at least.\
For detailed instructions, see [Official Go Website](https://go.dev).

Now you are ready to proceed with installation.

#### Installation

* Clone this project, checkout **lab1** branch, go to the `app_go` folder.

```shell
git clone https://github.com/Ilya-Kolomin/DevOps.git
cd DevOps
git checkout lab1
cd app_go
```

* Install needed dependencies.\
  You can do it manually or via command

```shell
go mod download

# optionally: verify download
go mod verify
```

* Build the source code by yourself

```shell
go build main.go
```

So now you have the binary to start your web server.

#### Usage

Start the built server by executing the `main` binary.

```shell
./main
```

The server will start and listen on 8080 port. You can visit
http://127.0.0.1:8080/ in order to check how it works.

So that is how my simple web application for showing current Moscow
time can be started and used.

### Using Docker

#### Prerequisites

Installed Docker on your machine. For details visit **[this](https://www.docker.com/get-started/)**.

#### Installation

You could either pull already built Docker image or build it by yourself.

```shell
# pull image
docker pull ilyakolomin/devops_app_go

# or build it by yourself

git clone https://github.com/Ilya-Kolomin/DevOps.git
cd DevOps
git checkout lab2
cd app_go
docker build . devops_app_go
```

#### Usage

Now you could run the container with the following commands.

```shell
docker run -p 8080:8080 -d devops_app_go
# or
docker run -p 8080:8080 -d ilyakolomin/devops_app_go:<tag>
```

Congratulations, now you could visit http://127.0.0.1:8080 to see current Moscow time.

## CI/CD

Currently, there is a CI pipeline that checks for tests and linters.
Also, it builds docker container and pushes it to [my hub repository](https://hub.docker.com/r/ilyakolomin/devops_app_go).

## Contact

Ilya Kolomin - @Ilya-Kolomin - i.kolomin@innopolis.university\
B19-CS-01 group at Innopolis University

Project Link: https://github.com/Ilya-Kolomin/DevOps/tree/lab1