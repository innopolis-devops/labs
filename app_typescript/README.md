# Typescript Time Web App

An app that allows to receive the current time in Moscow by a web request. Makes sure the time is correct by synchronizing it to the Google's NTP server at the startup.

## Docker image

### From Docker Hub

The app has a [docker image](https://hub.docker.com/r/ntdesmond/iu-devops-ts) in Docker Hub.

To fetch it, use `docker pull ntdesmond/iu-devops-ts` command.

### Building locally

Run `docker build -t ntdesmond/iu-devops-ts .` in the current directory to build the app locally.

### Start the app

Here is a sample command to run the image:

```sh
docker run --rm -p 3000:3000 ntdesmond/iu-devops-ts
```

You may want to change the port binding (`-p` option).

Note that within the container the app uses the port defined in [`.env`](./.env) file, and this may not match the port binding in the command above.

## Local setup

### Build

#### Requirements

- Node.js 16 (tested at 16.16.0)

---

- Install the packages: `npm install`

- Compile Typescript: `npm run build`

### Usage

After the app is compiled, it's stored in `build/index.js` file.

Use `npm start` to run it with Node.

For testing purposes, you may use `npm run dev`, which uses [`ts-node-dev`](https://github.com/wclr/ts-node-dev) to run the code and keep track of modifications in `index.ts`.

## See also

Check out [TYPESCRIPT.md](./TYPESCRIPT.md) for implementation details.
