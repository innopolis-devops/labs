## Overview
A simple Rust/Rocket app that shows current time. The timezone is *Europe/Moscow*

## Build

Make sure that you have docker and docker-compose installed. Run the following command to build the project

```bash
$ docker-compose build
```

## Running locally
Once the app is built, you can startup the server by running the following command

```bash
$ docker-compose up
```

Now, you can access the server at http://127.0.0.1:8000

Note that the timezone is configured within the code. The default offset is 3 hours (i.e., *Europe/Moscow*).
If you want to change the timezone, simply change it in the `utils.rs` file, and build the project.

## Linting
Additionally, you can run linters over the project code with the aid of the following command

```bash
$ docker-compose run server make lint
```