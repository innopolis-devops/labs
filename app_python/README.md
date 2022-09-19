# Timing app
[![Python App](https://github.com/e2xen/innopolis-devops-labs/actions/workflows/app_python.yml/badge.svg)](https://github.com/e2xen/innopolis-devops-labs/actions/workflows/app_python.yml)

A simple toy app that shows current Moscow time.
## Build
To install the app, make sure python3 is installed. You are free to use any virtual environment as well.

Now, install the necessary requirements:
```
pip install -r requirements.txt
```
## Run
Now you are ready to run the app:
```
uvicorn main:app
```
To make sure everything works fine, go to http://127.0.0.1:8000
## Docker
Alternatively, you can pull and run [docker hub](https://hub.docker.com/repository/docker/e2xen/devops-pythonapp/general) image of this app:
```
docker run -d -p 80:80 e2xen/devops-pythonapp:latest
```
To make sure everything works fine, go to http://127.0.0.1:80
## Testing
If you want to make sure that your installation is completely functional, just run the unit tests!
```
pytest
```
*pytest is included in the requirements file
## Contact
Telegram: @wheatendinosaur
