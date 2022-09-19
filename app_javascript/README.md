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
  - [Git Actions CI](#git-actions-ci)
  - [Contacts](#contacts)

## Build

### Local install

Before using the application you need to install:

- [java](https://phoenixnap.com/kb/install-java-windows)
- [npm](https://phoenixnap.com/kb/install-node-js-npm-on-windows)

To run the application you need to:

1. Clone the repository and go to it

``` bash
git clone https://github.com/Kamila-Khamidullina/devops
cd devops/app_js/app_js
```

1. Run the app with. The app will open at <http://localhost:3000/>

``` bash
npm start
```

## Docker

The application has a Dockerfile for simplified build.
To start with working with docker you need to install it.
[Here is the instruction](https://docs.docker.com/engine/install/).

### Build with local image

Clone the repository and go to it

```bash
git clone https://github.com/Kamila-Khamidullina/devops
cd devops/app_javascript/app_js
```

You need to build the image

```bash
docker build -t app .
```

![docker-build](/assets/build-js.jpg)

Then run this image with

```bash
docker run --publish 5000:5000 app
```

![docker-run](/assets/run_js.jpg)

The app will open at <http://localhost:3000/>.

### Building from image on DockerHub

The build image is located in the [hub](https://hub.docker.com/layers/kamilakhamidullina/devops_lab2/latest/images/sha256-b1c11ecae30354b092134033a3f2bc6fcc51b18997a3f9f4660153441d127572?context=repo).
![hub](/assets/hub_js.jpg)

You can pull it from there to your local storage

```bash
docker pull kamilakhamidullina/devops_lab2_bonus
```

![pull](/assets/pull_js.jpg)

And then run it

```bash
docker run --publish 3000:3000 kamilakhamidullina/devops_lab2_bonus
```

![run](/assets/build-run-js.jpg)

The app will open at <http://localhost:3000/>.

## Git Actions CI

This app is integrated with github actions.

- java_lint.yml - used to lint check the javascript files
- java.yml - installs the dependencies, builds the app, logins to the docker,
  builds the image and pushes it.

## Contacts

If you have any questions or suggestions, write me in Telegram: [@kamila_ak](https://t.me/kamila_ak)
