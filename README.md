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
2. Moscow time can be accessed by `/api/v1/moscow_time/` 

## Run unit tests
0. `cd app_python` 
1. `./test.sh`
