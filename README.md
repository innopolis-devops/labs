# MSC time
Simple, yet handy, flask web application that shows the current time in the
browser.

## Requirements
MSC time is provided as a docker image. You can pull it from [ghcr](https://github.com/Semior001/innopolis-devops-labs/pkgs/container/innopolis-devops-labs) packages with tag "lab1", e.g.:
```bash
docker pull ghcr.io/semior001/innopolis-devops-labs:lab1
```

## Build
To build image from source, you have to build the image from the root of the repository:
```bash
docker build -t lab1 -f lab1/app_python/Dockerfile .
```

And run it:
```bash
docker run -p 5000:5000 lab1
```

## Usage
No cli arguments are required. The application will be available at http://localhost:5000

## Docker

The dockerfile contains a build of a regular python application, with the use of base image `python:3.9-alpine`.
It just copies the script of the application itself and `requirements.txt` to the image, installs the dependencies and 
defines the 5000 port, as the application itself listens to it.

The entrypoint is set to `flask run --host=0.0.0.0`, so the flask application inside runs the Flask development server.

## Contribution
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

