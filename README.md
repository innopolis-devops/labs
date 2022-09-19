# Moscow Time app
![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

![python_app](https://github.com/boggda/inno_devops/actions/workflows/python_ci.yaml/badge.svg)

This is a simple web application that shows the current time in Moscow.

## Usage

You can get the json containing Moscow time by going to the root of the web page with your browser or by running the ```curl``` command in the command line.
```
┌──(kali㉿kali)-[~]
└─$ curl http://127.0.0.1:8000/      
{"msk_time":"21:11:47 04.09.2022"} 
```

## Installing

### Local installation

1) Clone repository:
    ```
    git clone https://github.com/boggda/inno_devops
    cd inno_devops/app_python/
    ```
2) Install dependencies:
    ```
    pip install -r requirements.txt
    ```

### Docker installation

Make sure docker is already installed.

1) Clone repository:
    ```
    git clone https://github.com/boggda/inno_devops
    cd inno_devops/app_python/
    ```
2) Build image
    ```
    docker build . -t moscow_app
    ```
    or pull image from docker hub
    ```
    docker pull boggda1337/moscow_app:ver_1
    ```

## Running

### Local installation

1) Enter the directory with the application
    ```
    cd moscow_time
    ```
2) Run web server
    ```
    uvicorn main:app --host 127.0.0.1 --port 8000
    ```

### Docker installation

1) Run docker container:
    ```
    docker run -p 8000:8000 -d --rm --name moscow_app moscow_app
    ```
    or if you pulled image from docker-hub
    ```
    docker run -p 8000:8000 -d --rm --name moscow_app boggda1337/moscow_app:ver_1
    ```
2) And to stop server:
    ```
    docker kill moscow_app
    ```

## Implementation

This simple web application was implemented using the FastAPI framework due to its simplicity and speed of development.
The application receives data from ```https://timeapi.io/api/Time/current/zone?timeZone=Europe/Moscow```. This API makes it easy to get the time for any time zone.

You get application documentation by accessing the ```/docs``` endpoint.

## Unit Tests

1) Install dependencies.
2) Run unit tests:
    ```
    cd app_python && pytest moscow_time
    ```

## Author

Bogdan Kondratev


