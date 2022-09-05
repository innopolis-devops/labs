# DevOps lab 1

___

## Overview

This is a simple webapp that shows current Moscow time on refreshing page  
There are 2 implementations written in python and dart

___

## Requirements

There are some requirements to run this apps

### Python

- You have to have python
- You need to download 2 libs: flask() and pytz (venv would work fine)

### Dart

- install flutter [link](https://docs.flutter.dev/get-started/install/linux)
- install chrome if you do not have it allready
- make sure with `flutter doctor` that you have "Chrome - develop for the web" checked (otherwise try to set CHROME_EXECUTABLE to your chrome executable with `export CHROME_EXECUTABLE=<path/to/chrome/executable>` and check one more time it should work)

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

Building this app is not required to run and test it but it is essential for later deplyment

Build with docker:

WIP

Build app on you local machine:

```bash
flutter build web
```

the build output might be found in ./build/web after build process is complited

___

## Run App

### Python

With docker:

```bash
docker run --network="host" --name="web" web
```

On local macine:

```bash
cd ./app_python
python3 ./main.py
```

after this you can access web app in your browser by url : `localhos:5000`

### Dart

With docker:

WIP

App can be started with

```bash
cd ./app_dart
flutter run -d chrome
```

app would be opened in you chrome browser

___

## Contact

lab done by Valentin Chernyshov

email: v.chernyshov@innopolis.university

telegram @wat4err
