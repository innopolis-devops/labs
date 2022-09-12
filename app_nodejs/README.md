## How to run
- Node js LTS version is required
- Run `node server.js` will boot server, and user can see the current time in Moscow on browser screen

## Run by docker
- write ` docker build -t node-app:latest .` in terminal to build image
- run container by command `ocker run -it -p 8000:8000 node-app`