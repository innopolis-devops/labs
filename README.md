Clock-clock
=======================

![py test](https://github.com/Amirka-Kh/devops-labs/actions/workflows/python-app.yml/badge.svg?style=for-the-badge)
![docker](https://github.com/Amirka-Kh/devops-labs/actions/workflows/lint.yml/badge.svg?style=for-the-badge)

## Content
1. [Description](#description)
> * [Project description](#project-description)
> * [Demo](#demo)
2. [Build](#build)
> * [Without Docker](#without-docker)
> * [With Docker](#with-docker)
3. [Project requirements](#project-requirements)
> * [User Stories](#user-stories)
> * [Required Features](#required-features)
> * [Non-functional Requirements](#non-functional-requirements)

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
