Clock-clock
=======================

![CI](https://github.com/Amirka-Kh/devops-labs/actions/workflows/build.yml/badge.svg?style=for-the-badge)
![docker](https://github.com/Amirka-Kh/devops-labs/actions/workflows/lint.yml/badge.svg?style=for-the-badge)

## Content
1. [Description](#description)
* [Project description](#project-description)
* [Demo](#demo)
2. [Build](#build)
* [Without Docker](#without-docker)
* [With Docker](#with-docker)
* [Unit tests](#unit-tests)
* [Use case](#use-case)
3. [Project requirements](#project-requirements)
* [User Stories](#user-stories)
* [Required Features](#required-features)
* [Non-functional Requirements](#non-functional-requirements)

## Description
### Project description
Clock-clock is clock which prints moscow time.

This website opens opportunity to know moscow time and safe time. The miracle is that time is updated only when 
you push the button. After pushing the button 'update' a new time appear. Manipulating with such
mechanism can save users time.

Clock-clock follows the next business goals:
- Control the moscow time
- Save time 
- Sell time

### Demo
![](https://github.com/Amirka-Kh/devops-labs/blob/lab1/demo.gif)

## Build
### Without Docker
1. Clone the repository.
2. Initialize virtual enviroment.
3. Install the requirements.
4. Start the app by `python <path_to_file>/main.py`
### With Docker
1. Clone the repository.
2. Build an image `docker build --tag clock-clock:v1.0.0 .`
or pull an image from docker hub `docker pull 254689393895236/clock-clock:v1.0.0`
3. Create and run a container from the built image
if you pulled an image then type the following:
`docker run -d --publish 8000:5000 --name clock-server 254689393895236/clock-clock:v1.0.0`
if you build it locally type next:
`docker run -d --publish 8000:5000 --name clock-server clock-clock:v1.0.0`
4. Access the website `localhost:8000`
### Unit tests
go to root directory and simply type:
`pytest` 
output may look like this:
```
============================================= test session starts =============================================
platform win32 -- Python 3.8.10, pytest-7.1.3, pluggy-1.0.0
rootdir: C:\Users\amira\PycharmProjects\devops-labs
collected 7 items

app_python\tests\test_logic.py ..                                                                        [ 28%]
app_python\tests\test_views.py .....                                                                     [100%]

============================================== 7 passed in 0.49s ============================================== 
```
### Use case
app is available by `localhost:8000`, to view specific timezone one can
address next url `localhost:8000/Europe-Moscow` that will show moscow time

## Project requirements
### User Stories
| User Type           | User Story Title | User Story                                                                                                                         |
|---------------------|------------------|------------------------------------------------------------------------------------------------------------------------------------|
| User                | UI               | As a user, I want special button to update the time.                                                                               |

### Required Features
1. Print moscow time in the main page.
2. Update time in the main page by pressing button.

### Non-functional Requirements
| Characteristics | Sub-characteristics | Definition                                                                                               |
|-----------------|---------------------|----------------------------------------------------------------------------------------------------------|
| Availability    | Availability        | The program should be available 99.99 percent of the time.                                               |
| Maintainability | Modifiability       | Every modification should be automatically built and deployed. Could be achieved by using GitHub Actions |

FAQ
---

Q: Are you going to sell this app?

A: No, it is a open project.

Contributing
------------

* source code: https://github.com/Amirka-Kh/devops-labs
