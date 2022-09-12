# Moscow time

# Overview

A python web app for getting time in Moscow.
Time returned as a JSON in standard ISO 8601 format.

# Build

## Prerequisites

- [Python 3.9+](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/cli/pip_download/)
- [Vale](https://vale.sh/docs/vale-cli/installation/)
- [virtualenv](https://virtualenv.pypa.io/en/latest/installation.html#)

## Local installation and usage

1. Clone GitHub repository

    ```bash
    git clone https://github.com/Ziucay/labs.git
    cd labs
    ```
2. Switch to lab1 branch

   ```bash
   git checkout lab1
   ```

3. Create virtual environment

    ```bash
    python3 -m virtualenv venv
    source venv/bin/activate
    ```

4. Install requirements

   ```bash
    pip install -r app_python/requirements.txt
    ```

5. Run app

   ```bash
   uvicorn app_python.main:app
   ```

You can access app on http://localhost:8000/

For debug purposes add `--reload` flag, to make server
reloading on code changes

   ```bash
   uvicorn moscow_time.main:app --reload
   ```


## Run via Docker

1. Pull image from docker hub

   ```bash
   docker pull ziucay/pythonapp:0.2
   ```
   
2. Run container

   ```bash
   docker run -d -p 8000:8000 --rm --name pythonapp ziucay/pythonapp:0.2
   ```

## Contact

For questions and suggestions, write in [Telegram](https://web.telegram.org/): [@ziucay](https://t.me/Ziucay)
