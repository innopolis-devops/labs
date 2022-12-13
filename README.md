[![My_orkflow](https://github.com/dannakk/labs/actions/workflows/ci.yaml/badge.svg)](https://github.com/dannakk/labs/actions/workflows/ci.yaml)


# Show me time

Show me time is a web application to display the current time in the Moscow timezone.
The application is written on Python language and uses Flask framework.

WorldTimeApi was used to retrieve the current time in the Moscow.

## Framework & API

These are the technologies Show Me Time used to work:

- [Flask] - Python framework✨
- [WorldTimeAPI] - Api to return the current time in the timezone✨

## How to build?
Step 1. Clone the repo
```sh
git clone https://github.com/dannakk/devops.git
```

Step 2. Go into the app_python folder
```sh
cd app_python
```

Step 3. Install all the dependencies
```sh
pip3 install -r requirements.txt
```

Step 4. Run the python file in the terminal
```sh
python "app.py"
```

Step 5. Open the link of your localhost

## Building and Running Docker image
Step 1. Clone the repo
```sh
git clone https://github.com/dannakk/devops.git
```

Step 2. Go into the app_python folder
```sh
cd app_python
```

Step 3. Build docker image
```sh
docker build --tag dannones/python-docker .
```

Step 4. Run docker image
```sh
docker run -d -p 5000:5000 dannones/python-docker
```
Step 5. Open http://localhost:5000/

## Running unit tests
Step 1. Go into the app_python folder
```sh
cd app_python
```

Step 2. Run the following command
```sh
python test_app.py
```

## Usage
- Run the app to view the current time in Moscow
- Refresh the page to get an updated current time

## Contact
My telegram alias: @dannones

 [Flask]: <https://github.com/joemccann/dillinger>
 [WorldTimeApi]: <http://worldtimeapi.org/>