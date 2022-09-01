# Moscow time web application Python/Node.js

## Introduction
---------------

This is web application that shows the current date and time in Moscow. We have two version of same application: one is written in Python and the second in Node.js. You can use more comfortable version for you

# Python

## Requirements
---------------

This application is built on [Python](https://www.python.org). Before you start using it you need to install it. Also, it requires to install [FastAPI](https://fastapi.tiangolo.com) and [uvicorn](https://www.uvicorn.org).

## Installation and Start the application
----------------

To install all dependencies that used in this project you need to run following command:

```
pip install -r app_python/requirements.txt
```

After this we need to start our server with the commands:

```
cd app_python
uvicorn main:app --reload
```

## Results
--------------

If you will not get any errors go to http://127.0.0.1:8000 to see the result. Update the page to update the time

To see the documentation of our application go to http://127.0.0.1:8000/docs#/

# Node.js

## Requirements
---------------

This application is built on [Node.js](https://nodejs.org/en/). Before you start using it you need to install it. Also, it requires to install [ExpressJS](https://expressjs.com).

## Installation and Start the application
----------------

To install all dependencies that used in this project you need to run following command:

```
cd app_nodejs
npm install
```

After this we need to start our server with the commands:

```
node index.js
```

## Results
--------------

If you will not get any errors go to http://127.0.0.1:3000 to see the result. Update the page to update the time
