# DevOps course at Innopolis University

![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)

## Overview

Python and Javascript Web App using [FastAPI framework](https://fastapi.tiangolo.com), [Express.js](https://expressjs.com/ru/) and [WorldTimeAPI](http://worldtimeapi.org) for Moscow time.

## Getting Started

### Python

#### Local installation

Before running the application, please install its prerequisites:

- [Python 3.9+](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/installation/)

To run from the master branch, follow the instructions below:

1. Clone web application repository locally.
   ```bash
   git clone https://github.com/k05m0navt/labs
   ```
2. Create virtual environment.
   ```bash
   cd app_python/
   pipenv shell
   ```
3. Install packages.
   ```bash
   pipenv install
   ```
4. Run the application. Web app will open at [http://127.0.0.1:8000/](http://127.0.0.1:8000/).

   ```bash
   uvicorn moscow_time.main:app --reload
   ```

### Javascript

#### Local installation

Before running the application, please install its prerequisites:

- [Node 16.18.1+](https://nodejs.org/en/)

To run from the master branch, follow the instructions below:

1. Clone web application repository locally.

   ```bash
   git clone https://github.com/k05m0navt/labs
   ```

2. Install dependencies.

   ```bash
   cd app_javascript/
   npm i
   ```

3. Run the application. Web app will open at [http://localhost:3333/](http://localhost:3333/).

   ```bash
   npm start
   ```

## Contacts

If you have any questions or ideas, write me in [Telegram](https://telegram.org): [@k05m0navt](https://t.me/k05m0navt/)
