# DevOps Labs

## About

This is a python web application on flask framework.
It shows current Moscow time in browser.

## Table of contents

- [DevOps Labs](#devops-labs)
  - [About](#about)
  - [Table of contents](#table-of-contents)
  - [Build](#build)
    - [Local install](#local-install)
  - [Docker](#docker)
    - [Build with local image](#build-with-local-image)
    - [Building from image on DockerHub](#building-from-image-on-dockerhub)
  - [Contacts](#contacts)

## Build

### Local install

Before using the application you need to install:

- [Python 3](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/installation/)
- [flask](https://pypi.org/project/Flask/)

To run the application you need to:

1. Clone the repository and go to it

```bash
git clone https://github.com/Kamila-Khamidullina/devops
cd devops/app_python
```

1. Run the app with. The app will open at <http://localhost:5000/>

```bash
flask run
```

![app](/assets/app.jpg)

## Docker

The application has a Dockerfile for simplified build.
To start with working with docker you need to install it.
[Here is the instruction](https://docs.docker.com/engine/install/).

### Build with local image

Clone the repository and go to it

```bash
git clone https://github.com/Kamila-Khamidullina/devops
cd devops/app_python
```

You need to build the image

```bash
docker build -t app .
```

![docker-build](/assets/docker_build.jpg)

Then run this image with

```bash
docker run --publish 5000:5000 app
```

![docker-run](/assets/docker_run.jpg)

The app will open at <http://localhost:5000/>.

### Building from image on DockerHub

The build image is located in the [hub](https://hub.docker.com/layers/kamilakhamidullina/devops_lab2/latest/images/sha256-b1c11ecae30354b092134033a3f2bc6fcc51b18997a3f9f4660153441d127572?context=repo).
![hub](/assets/docker_hub.jpg)

You can pull it from there to your local storage

```bash
docker pull kamilakhamidullina/devops_lab2
```

![pull](/assets/docker_pull.jpg)

And then run it

```bash
docker run --publish 5000:5000 kamilakhamidullina/devops_lab2
```

![run](/assets/docker_run_pull.jpg)

The app will open at <http://localhost:5000/>.

## Contacts

If you have any questions or suggestions, write me in Telegram: [@kamila_ak](https://t.me/kamila_ak)
