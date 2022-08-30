# Make Your Time

## Overview

This web-application will quickly help you find out what time it is now in Moscow.
You can learn what time it is now in other places, too.

## How to Build and Run

> It is required to use Python 3.10 or newer.

1. Clone this repository.
2. In root folder, run `python -m venv venv` to create virtual environment.
3. On Windows, run `./venv/Scripts/pip install -r requirements.txt` to install dependencies.
For Linux, the command is `./venv/bin/pip install -r requirements.txt`.
4. Run `./run.sh` script.

## Usage

Go to `127.0.0.1:8000` in your browser to see the current Moscow Time.

If you update the page, the time will update too.

You can also go to `127.0.0.1:8000/Asia/Krasnoyarsk` to see the current time in Krasnoyarsk.
It works with other IANA timezones in the similar fashion.

