# Golang WebApp Moscow Time

## Table of Contents

* [About The Project](#about-the-project)

* [How To Build](#getting-started)

* [Usage](#usage)

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
   docker run -p 3000:3000 johndenkis/simple_python_go
   ```

## Usage

There are two ways to see the web page:

1. Enter the url inside the browser: <http://localhost:3000/>
2. Run the command: `$ curl localhost:3000`
   Then you will see the page with current time in Moscow.

## Contact

Polina Minina

* Telegram: [@JohnDenkis](https://t.me/JohnDenkis)

* Email: p.minina@innopolis.university

Project Link: [https://github.com/pminina01/Innopolis_DevOps2022](https://github.com/pminina01/Innopolis_DevOps2022)
