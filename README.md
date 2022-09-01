# Moscow time

# Overview

A python web app for getting time in Moscow.
Time returned as a JSON in standard ISO 8601 format.

# Build

## Prerequisites

- [Python 3.9+](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/cli/pip_download/)
- [Vale](https://vale.sh/docs/vale-cli/installation/)

## Local installation and usage

1. Clone GitHub repository

    ```bash
    git clone https://github.com/Ziucay/labs.git
    cd labs
    ```

2. Create virtual environment

    ```bash
    python3 -m virtualenv venv
    source venv/bin/activate
    ```

3. Install requirements
    
   ```bash
    pip install -r requirements.txt
    ```

4. Run app
   
   ```bash
   uvicorn moscow_time.main:app
   ```
   
You can access app on http://localhost:8000/

For debug purposes add `--reload` flag, to make server
reloading on code changes

   ```bash
   uvicorn moscow_time.main:app --reload
   ```

## Contact

For questions and suggestions, write in [Telegram](https://web.telegram.org/): [@ziucay](https://t.me/Ziucay)