# Typescript Time Web App

[![Testing CI status](https://github.com/ntdesmond/iu-devops-labs/actions/workflows/test-typescript.yml/badge.svg)](https://github.com/ntdesmond/iu-devops-labs/actions/workflows/test-typescript.yml)

---

## Features

- App shows the current time in Moscow at `/` route
- App counts successfully served requests
- App has a status route `/status`, which displays the served requests count as well.
- Routes accept only `GET` requests, giving out proper errors (404/405) on incorrect requests.

## Docker image

### Docker Compose — preffered method

New app versions require Redis database for storing metrics and will not work without Redis connection.
It is highly recommended to use Docker Compose to run the app:

```sh
docker compose up -d
```

Anyway, here are the instructions in case you want to run the app separately, assuming you have a running Redis server.

### From Docker Hub

The app has a [docker image](https://hub.docker.com/r/ntdesmond/iu-devops-ts) in Docker Hub.

To fetch it, use `docker pull ntdesmond/iu-devops-ts` command.

Note that this docker image is built with `REDIS_URL` set to `redis://redis:6379`, as per [`.env`](./.env) file.

### Building locally

Run `docker build -t ntdesmond/iu-devops-ts .` in the current directory to build the app locally.

You may want to edit [`.env`](./.env) file first.

### Start the app

Here is a sample command to run the image:

```sh
docker run --rm -p 3000:3000 ntdesmond/iu-devops-ts
```

You may also want to change the port binding (`-p` option).

Note that within the container the app uses the port defined in [`.env`](./.env) file, and this may not match the port binding in the command above.

## Local setup

### Build

#### Requirements

- Node.js 16 (tested at 16.16.0)

---

- Install the packages: `npm install`

- Edit [`.env`](./.env) file to suit your needs

- Compile Typescript: `npm run build`

### Usage

After the app is compiled, it's stored in `build/index.js` file.

Use `npm start` to run it with Node.

For testing purposes, you may use `npm run dev`, which uses [`ts-node-dev`](https://github.com/wclr/ts-node-dev) to run the code and keep track of modifications in `index.ts`.

## See also

Check out [TYPESCRIPT.md](./TYPESCRIPT.md) for implementation details on the app and its tests.
