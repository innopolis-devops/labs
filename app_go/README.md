# Golang WebApp Moscow Time
![Golang](https://github.com/pminina01/Innopolis_DevOps2022/actions/workflows/go.yml/badge.svg)

## Table of Contents

* [About The Project](#about-the-project)

* [How To Build](#getting-started)

* [Usage](#usage)

* [Unit tests](#unit-tests)

* [GitHub Actions](#github-actions)

* [Contact](#contact)

## About The Project

The project inside this folder is a simple Golang web application that shows current time in Moscow. The time is updated only when you update the page.

### Built With

* Golang
* net/http package

## Getting Started

You can run the application following the next steps:

1. Clone the code:

    ```bash
    git clone https://github.com/pminina01/Innopolis_DevOps2022
    ```

2. Enter the folder with application

    ```bash
    cd Innopolis_DevOps2022/app_go
    ```

3. Run the following command to start the application

   ```bash
   go run app.go
   ```
   
## Getting Started (docker)

You can run the application using the docker:

1. Build or pull image:

   ```bash
   # Build image
   cd app_go
   docker build . -t johndenkis/simple_python_go
   ```

   ```bash
   # Pull image
   docker pull johndenkis/simple_python_go
   ```

2. Run container:

   ```bash
   docker run -p 2222:2222 johndenkis/simple_python_go
   ```

## Usage

There are two ways to see the web page:

1. Enter the url inside the browser: <http://localhost:2222/>
2. Run the command: `$ curl localhost:2222`
   Then you will see the page with current time in Moscow.

## Unit tests
There is unit test for project built with pytest module. You can run them using the following commands:
```bash
cd app_go
go test --coverprofile=c.out
go tool cover --func=c.out
```

## GitHub Actions

Project have github workflow, some useful features you can see below:
* Lint job is implemented
* Test and install dependencies job is implemented
* Docker Login, Build & Push job is implemented
* Snyk check job is implemented
* Added a workflow status badge to README
* Build cache is used
* CI runs only if there are changes in the app_go folder

## Contact

Polina Minina

* Telegram: [@JohnDenkis](https://t.me/JohnDenkis)

* Email: p.minina@innopolis.university

Project Link: [https://github.com/pminina01/Innopolis_DevOps2022](https://github.com/pminina01/Innopolis_DevOps2022)
