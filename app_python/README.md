# Python app

## Build and Run

### Build with Podman

1. Build

   ```bash
   podman build . -t app_python
   ```

2. Run

   ```bash
   podman run -p 8080:8080 app_python 
   ```

### Run locally without containers

1. Install dependencies

   ```bash
   poetry install
   ```

2. Run

   ```bash
   poetry run uvicorn app:app --port 8080
   ```

## Usage

Navigate to our app and see current time in ISO format
