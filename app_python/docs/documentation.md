# Documentation

## Getting started

### Prerequisites

* [Python](https://www.python.org/downloads/)

### Running directly from command line

1. Clone the repository

    ```bash
    git clone https://github.com/Sh1co/DevOps-Labs
    ```

2. Go to app directory

    ```bash
    cd app_python
    ```

3. Install dependencies:

    ```Bash
    pip install -r requirements.txt
    ```

4. Run the app

    ```bash
    flask run
    ```

### Running using the Dockerfile

1. Clone the repository

    ```bash
    git clone https://github.com/Sh1co/DevOps-Labs
    ```

2. Go to app directory

    ```bash
    cd app_python
    ```

3. Build Dockerfile

    ```bash
    docker build -t python-app .
    ```

4. Run docker image

    ```bash
    docker run -d -p 5000:5000 python-app
    ```

## Testing

First, run `pip install -r requirements-dev.txt` to install the test (and other dev) dependencies.
Then, run the tests:

```bash
pytest run_tests.py
```

## Usage

To use the app just open your browser then go to <http://127.0.0.1:5000/get_time>
