# app_python

An application that shows current time in Europe/Moscow timezone

## Running

```bash
# RECOMMENDED: Create and activate virtual environment
python3 -m venv .venv
source ./.venv/bin/activate
# Install dependencies
pip3 install -r requirements.txt
# Run development server
uvicorn main:app --host 127.0.0.1 --port 8080 --reload
# Run production server
uvicorn main:app --host 0.0.0.0 --port 8080
# And visit the page at http://127.0.0.1:8080
```

## Docker

Since lab2 **app_python** is also available as docker image [azazkamaz/tmp_inno_devops_labs:app_python-latest](https://hub.docker.com/r/azazkamaz/tmp_inno_devops_labs)

```bash
# Run docker image and expose the service on port 1080
docker run -p 1080:8080 azazkamaz/tmp_inno_devops_labs:app_python-latest

# ADVANCED: Build image for several architectures
docker buildx build \
    --platform linux/arm64/v8,linux/amd64 \
    --tag azazkamaz/tmp_inno_devops_labs:app_python-latest \
    .
```