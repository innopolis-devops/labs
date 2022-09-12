# Moscower

A web app to get Moscow time

## Usage

### Run locally

Before proceeding, make sure you have python 3.10 or greater installed

First, get the code
```bash
git clone https://github.com/Anatolay/devops
cd devops/app_python
```
Then, install dependencies with

```bash
pip install -r requirements.txt
```

Now you are ready to run with
```bash
uvicorn main:app --reload
```

## Docker
You can use a docker image which has the app and all its dependencies installed. The image is [nihon/moscower](https://hub.docker.com/repository/docker/nihon/moscower)

## Tests

Make sure you are inside the app's directory
```bash
cd devops/app_python
```
Run unit tests with
```bash
pytest tests
```

## Trouble shooting

#### Template time.html not found
Make sure you are running the code inside the `app_python` directory

## Contact
You can reach out to me at a.baskakov@innopolis.university