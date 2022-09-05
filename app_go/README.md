
# Moscow Time Web Application

## About The Project

This is a simple web application that shows current time in Moscow.\
_Note_: the time updates only when page refreshes.

![](https://i.imgur.com/Uhka5Fu.gif)

### Built With

* ![](https://img.shields.io/badge/golang-1.17.6-blue?style=for-the-badge&logo=go)
* ![](https://img.shields.io/badge/gin-1.8.1-blue?style=for-the-badge&logo=gin)

## Getting Started

This is a small guide how to prepare and install my project.

### Prerequisites

First of all you will need Go compiler. I will recommend to
install the latest one or 1.17.6 version at least.\
For detailed instructions, see [Official Go Website](https://go.dev).

Now you are ready to proceed with installation.

### Installation

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

## Usage
Start the built server by executing the `main` binary.
```shell
./main
```

The server will start and listen on 8080 port. You can visit http://127.0.0.1:8080/ in order to check how it works.

So that is how my simple web application for showing current Moscow
time can be started and used.

## Contact

Ilya Kolomin - @Ilya-Kolomin - i.kolomin@innopolis.university\
B19-CS-01 group at Innopolis University

Project Link: https://github.com/Ilya-Kolomin/DevOps/tree/lab1