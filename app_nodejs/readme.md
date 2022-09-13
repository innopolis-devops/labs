# DevOps course at IU

## Overview

This is Python web application written using [Express](https://expressjs.com/) and [WorldTimeAPI](http://worldtimeapi.org) showing Moscow time.

## Getting Started

### Local installation

Before running the application, please install its prerequisites:

* [node js](https://nodejs.org/en/)
* [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

To run from the master branch, follow the instructions below:

1. Clone web application repository locally.

    ```bash
    clone https://github.com/ease-ln/devOps.git
    cd devOps/app_nodejs/
    ```

2. Install packages.

    ```bash
    npm install --save my-dependency
    ```

3. Run the application.

    ```bash
    node app.js
    ```

### Docker installation

Before running the application, please install its prerequisites:

* [Docker 20.10.17+](https://www.docker.com/products/docker-desktop/)

1. Clone web application repository locally and launch docker.

    ```bash
    clone https://github.com/ease-ln/labs.git
    cd labs/app_nodejs
    ```

2. Build the image.

    ```bash
   docker build --tag app_nodejs .
    ```

3. Run the container.

    ```bash
   docker run --publish 5000:5000 app_nodejs
    ```

### Usage

You can run app and open [localhost](http://localhost:5000/) to view current Moscow time.

### Development&Contacts

Any problems or suggestions? You can contact me via [telegram](https://t.me/ease_l).
