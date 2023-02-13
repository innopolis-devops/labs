[![linting: pylint](https://img.shields.io/badge/linting-pylint-yellowgreen)](https://github.com/PyCQA/pylint)
[![workflow](https://github.com/NurbakZh/DevOps-Nurba/actions/workflows/ci.yaml/badge.svg)](https://github.com/NurbakZh/DevOps-Nurba/actions/workflows/ci.yaml)



# Time web application

______________________________________________________________________

## Description

______________________________________________________________________

A simple Python web application, that shows current time in Moscow.
Time is updated on page refresh(*due to requirements*).

It is running on http://127.0.0.1:8080

## Build

______________________________________________________________________

- Clone this repo or get the directory as .zip from GitHub
- Install python3
- Install flask, datetime and pytz with:

```
cd app_python
pip install -r requirements.txt
```

## Usage

______________________________________________________________________

- Run command from below

```
python3 server.py
```

- open http://127.0.0.1:8080 to see the result

## Docker

______________________________________________________________________

- Clone repo from the git, and install [docker](https://docs.docker.com/get-docker/)
- Build docker image manually:

```
cd app_python
docker build --tag nurbakzh/app_python .
```

- Or pull docker image from existing repo on Docker hub:

```
cd app_python
docker pull nurbakzh/app_python
```

- Run image:

```
docker run -p 80:5000 nurbakzh/app_python
```

- Check result:

**Open http://127.0.0.1:80**

## Unit Test

______________________________________________________________________

- Install pytest module, rather by *pip install*, or using
  requirements
- Open directory with tests
- Run test/s, using commands from below:

```
pytest - for all tests
pytest name_of_the_test.py - for exact test
```

## Contact

______________________________________________________________________

- **Author**: Nurbek Zhomartov
- **Mail**: n.zhomartov@innopolis.university
- [Telegram](https://t.me/nurbak_zh)
