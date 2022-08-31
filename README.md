# Moscow time

# Overview

A python web application for getting time in Moscow.
Time returned as a JSON in ISO 8601 format.

# Build

## Prerequisites

- Python 3.9+
- pip

## Local installation and usage

1. Clone GitHub repository and move in repo root directory:

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

4. Run Application
   
   ```bash
   uvicorn moscow_time.main:app
   ```
   
Application will be accessed on http://localhost:8000/

For debug purposes add `--reload` flag, to make server
reloading on code changes

   ```bash
   uvicorn moscow_time.main:app --reload
   ```

## Contact

In case of questions and suggestions, write in Telegram: @ziucay