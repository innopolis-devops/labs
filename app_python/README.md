# Lab 1
## Overview
The current program launches local server which shows Moscow time.

## Build
1. Clone the repo
```
git clone https://github.com/Homa3030/labs
```
2. Go to the ```app_python``` directory
```
cd ./devops/app_python
```
3. Install pip requirements
```
pip install -r /path/to/requirements.txt
```

## Usage
1. Execute program
```
python -m flask run
```
2. Open link from the terminal

## Docker

A docker image for the Python Application.

### Building an image

1. Install Docker by following the [instructions](https://docs.docker.com/engine/install/)

2. Go to the `app_python` directory

```sh
cd app_python
```

3. Launch the build

```sh
docker build . -t app_python .
```

### Launching the prebuilt image

1. Pull the image from [Docker Hub](https://hub.docker.com/r/homa3030/app_python)
2. Run the image

```sh
docker run -p8080:8080 homa3030/app_python
```

## Contact
Telegram: [@homchanski](https://t.me/homchanski)

Email: r.khamatova@innopolis.university
