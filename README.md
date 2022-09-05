# Lab Assignment #1
This is a web server that shows current time in Moscow. 

NOTE: it uses <a href="http://worldtimeapi.org">other API</a> to get time in Moscow time zone
<br>
<div align="center">
  <kbd>
    <img width=500px src="https://i.imgur.com/Cmdsckx.png" />
  </kbd>
</div>

## Description
The project is an application that serves html with a current time in Moscow. The time which you can see on the index page is going to have Moscow timezone every single time(no matter where you are), because I used <a href="http://worldtimeapi.org">third-party API</a>. 

### Features
- It's an application that serves HTML.
- It shows you current time in Moscow.

### Built with
- Python v3.9.4
- Django Framework v4.1
- Requests module

## Getting started

### Prerequisites
- Get <a href="https://www.python.org/downloads/">Python</a> installed (you may do it using this <a href="https://www.python.org/downloads/">link</a> or using package manager).
- Get <a href="https://docs.djangoproject.com/en/4.1/topics/install/#installing-official-release">Django</a> and <a href="https://requests.readthedocs.io/en/latest/user/install/#install">Requests</a> installed.
    ```
    python -m pip install Django
    python -m pip install requests
    ```
### Run locally
In order to run it locally run this command in terminal ```python manage.py runserver``` from ```./app_python/hw1``` directory

## To-do

- [ ] Add unit tests
- [ ] Add linter
- [x] Use API
