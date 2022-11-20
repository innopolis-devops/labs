# Python WebApp Moscow Time

![Python](https://github.com/pminina01/Innopolis_DevOps2022/actions/workflows/python-package.yml/badge.svg)

* [About The Project](#about-the-project)

* [Getting Started (manually)](#getting-started-manually)

* [Getting Started (docker)](#getting-started-docker)

* [Unit tests](#unit-tests)

* [GitHub Actions](#github-actions)

* [Usage](#usage)

* [Contact](#contact)

## About The Project

The project inside this folder is a simple python web application that shows current time in Moscow. The time is updated only when you update the page.

* Access `http://127.0.0.1:5000/` main path to see the current time

* Access `http://127.0.0.1:5000/visits` visits path to see the time when user access main path `/`

* Access `http://127.0.0.1:5000/health` health check path to see the availability status of an app

* Access `http://127.0.0.1:5000/metrics` metrics path to see the prometheus metrics

### Built With

* Python
* Flask framework

## Getting Started (manually)

You can run the application manually following the next steps:

1. Clone the code from repository:

    ```bash
    git clone https://github.com/pminina01/Innopolis_DevOps2022
    ```

2. Enter the folder with application:

    ```bash
    cd Innopolis_DevOps2022/app_python
    ```

3. Then install the dependencies:

    ```bash
    pip install -r requirements.txt       
    ```

   Alternatively, you can firstly set virtual environment and then install packages:

    ```bash
    python3 -m venv <myenvname>  
    source <myenvname>/bin/activate  
    pip install -r requirements.txt  
    ```

4. Run the following command to start the application:

    ```bash
    flask run --host=0.0.0.0 --port=5000
    ```
   
## Getting Started (docker)

You can run the application using the docker:

1. Build or pull image:
   
   ```bash
   # Build image
   cd app_python
   docker build . -t johndenkis/simple_python_app
   ```
   
   ```bash
   # Pull image
   docker pull johndenkis/simple_python_app
   ```

2. Run container:

   ```bash
   docker run -p 5000:5000 johndenkis/simple_python_app
   ```
   
## Usage

There are two ways to see the web page:

1. Enter the url inside the browser: <http://127.0.0.1:5000>
2. Run the command: `$ curl 127.0.0.1:5000`
   Then you will see the page with current time in Moscow.

## Unit tests
There is unit test for project built with pytest module. You can run them using the following commands:
```bash
cd app_python
pytest .
```

## GitHub Actions

Project have github workflow, some useful features you can see below:
* Lint job is implemented
* Test and install dependencies job is implemented
* Docker Login, Build & Push job is implemented
* Snyk check job is implemented
* Added a workflow status badge to README
* Build cache is used
* CI runs only if there are changes in the app_python folder


## Contact

Polina Minina

* Telegram: [@JohnDenkis](https://t.me/JohnDenkis)

* Email: p.minina@innopolis.university

Project Link: [https://github.com/pminina01/Innopolis_DevOps2022](https://github.com/pminina01/Innopolis_DevOps2022)
