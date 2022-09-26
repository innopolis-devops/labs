# DevOps lab 2

![python workflow](https://github.com/zZzwat4er/devops_labs/actions/workflows/python.yaml/badge.svg?branch=lab3)
![dart workflow](https://github.com//zZzwat4er/devops_labs/actions/workflows/dart.yaml/badge.svg?branch=lab3)

___

## Overview

This is a simple webapp that shows current Moscow time on refreshing page  
There are 2 implementations written in python and dart

___

## Requirements

There are some requirements to run this apps

### Python

- You have to have python
- You need to download 4 libs:
  - flask
  - flake8
  - pytz
  - pytest

### Dart

- install flutter [link](https://docs.flutter.dev/get-started/install/linux)
- install chrome if you do not have it allready
- make sure with `flutter doctor` that you have "Chrome - develop for the web" checked (otherwise try to set CHROME_EXECUTABLE to your chrome executable with `export CHROME_EXECUTABLE=<path/to/chrome/executable>` and check one more time it should work)

___

## Tests

### Python

```bash
cd ./app_python
python -m pytest 
```

### Dart

```bash
cd ./app_dart
flutter test --platform chrome
```

___

## Build

### Python

unsig dokcer:

```bash
cd ./app_python
docker build ./ -t web:latest
```

on local machine no special build required

### Dart

Build with docker:

```bash
cd ./app_dart
docker build ./ -t web:latest
```

Build app on you local machine:

```bash
cd ./app_dart
flutter build web --release
mkdir -p ./build/web/packages/timezone/data/ \
&& cp ./data/latest.tzf ./build/web/packages/timezone/data/latest.tzf
```

the build output might be found in ./build/web after build process is complited

___

## Run App

### Python

With docker that you have builded:

```bash
docker run --network="host" --name="web" web
```

With docker from docker hub:

```bash
docker run --network="host" --name="web" wat4er/inno_devops:python 
```

On local macine:

```bash
cd ./app_python
python3 -m app
```

after this you can access web app in your browser by url : `localhos:5000`

### Dart

With docker that you have builded:

```bash
docker run --network="host" --name="web" web
```

With docker from docker hub:

```bash
docker run --network="host" --name="web" wat4er/inno_devops:dart 
```

On local macine after build:

```bash
cd ./app_dart/build/web
python3 -m http.server 5000 
```

after this you can access web app in your browser by url : `localhos:5000`

On local macine without build:

```bash
cd ./app_dart
flutter run -d chrome 
```

after this app would be open in your browser

___

## Contact

lab done by Valentin Chernyshov

email: v.chernyshov@innopolis.university

telegram @wat4err
