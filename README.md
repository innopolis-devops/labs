# Moscow time zone web application

This application launches a web server that runs on port 8000 and responds with current time in Moscow timezone.

## Python implementation

You can find implementation written in Python language in folder `app_python`. Also there is `PYTHON.md` file in the directory that lists some best practices used in the project and reasoning behind framework choice.

### How to run

This application can be set up/run manually or as a docker container

#### Docker way

* First you need to open project folder and build docker image with
 `docker build .`
* then you can run the image with
`sudo docker run -p 8000:8000 --rm <image ID>`
* everything should be ready! You can open [localhost:8000](localhost:8000) and you should see current Moscow time!

#### Manual way

* Open project folder
* Create virtual environment with `python3 -m venv venv`
* Activate the venv with `. venv/bin/activate`
* Install requirements with `pip3 install -r requirements.txt`
* Run the server with `gunicorn app:app -b 0.0.0.0:8000`
