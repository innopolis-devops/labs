# Web application
Web server which can return Moscow time on page `/api/v1/moscow_time/`

## Install
0. `cd app_python`
1. Create virtual env: `python3 -m venv venv`
2. Activate venv: `source venv/bin/activate`
3. Install dependencies: `pip install -f requirements.txt`

## Run
0. `cd app_python` 
1. `./run.sh`
2. Swagger available at `/docs`


## Endpoints
1. Moscow time can be accessed by `/api/v1/moscow_time/` 
2. Accessing `/` will add time of the visit to `logs/visits.log`
3. By `/visits` all visits of root url will be returned

## Run unit tests
0. `cd app_python` 
1. `./test.sh`

## Docker

### Image
`simonwt/moscow-time-fastapi`
https://hub.docker.com/repository/docker/simonwt/moscow-time-fastapi

Default port 8001

`docker pull simonwt/moscow-time-fastapi`
`docker run -p 8001:8001 -d -t simonwt/moscow-time-fastapi`