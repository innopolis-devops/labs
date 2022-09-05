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
