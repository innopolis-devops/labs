# Make Your Time

## Overview

This web-application will quickly help you find out what time it is now in Moscow.
You can learn what time it is now in other places, too.

## How to Build and Run

You have to have Docker installed, and Docker daemon running.

### Build locally

1. Clone this repository.
2. In its root folder, simply execute `build_and_run.sh` script.

It will build an image locally and run a container with it.

### Simple run

Execute the `run.sh` script. It will pull the already built repository and run it.

### Stop the container

To stop and delete the container, execute `stop.sh` script.

## Usage

Go to `127.0.0.1:8000` in your browser to see the current Moscow Time.

If you update the page, the time will update too.

You can also go to `127.0.0.1:8000/Asia/Krasnoyarsk` to see the current time in Krasnoyarsk.
It works with other IANA timezones in the similar fashion.
