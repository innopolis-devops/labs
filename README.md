# GMT+3 time web appliction

## Overview

---------------

GMT+3 Time web application allows it's users to see up-to-date time and date in GMT+3 (UTC+3) Timezone. This timezone corresponds to  Moscow time in Russia. The appication is written in Python

This is web application that shows the current date and time in Moscow. We have two version of same application: one is written in Python and the second in Node.js. You can use more comfortable version for you

To see API documentation, visit <http://127.0.0.1:8000/docs#/>

## Dependencies

---------------
You need to install following dependencies to work with GMT+3 time server:

- Python language [Python](https://www.python.org)
- Python framework [FastAPI](https://fastapi.tiangolo.com)
- ASGI web server [uvicorn](https://www.uvicorn.org)

You can use

```bash
pip install fastapi
pip install uvicorn
```

## Deployment

---------------

You need to execute following steps to run web-server on your local machine:

```bash
cd app_python
```

```bash
pip install -r requirements.txt
```

```bash
uvicorn main:app --reload
```

## Usage

---------------

Open  <http://127.0.0.1:8000> in your browser to see the current GMT+3 time.

Refresh your browser page to update time

## Contact

---------------
You can adress any questions about this web-server to dim.tsaplia@mail.ru
