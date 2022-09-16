# Current Moscow Time application

## Table of content
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Docker](#docker)
- [Contact](#contact)

## Description

This application created for showing current time from [WorldTimeAPI](http://worldtimeapi.org/). Application written with using **Python** + **Flask**

## Installation

- Install [Python](https://python.org)
- Create virtual environment: \
  `python3 -m venv venv`
- Activate it using commands: \
  **Windows**: \
  `venv\Scripts\activate.bat` \
  **Linux&MacOS**: \
  `source venv/bin/activate`
- Install requirements: \
  `pip install -r requirements.txt`

## Usage

- Go to app_python directory \\
- Write:
  ```
  python main.py
  ```
- Open link to see current time:
  ```
  http://127.0.0.1:5000
  ```

## Docker
#### Building on local machine
- Install [Docker](https://www.docker.com/products/docker-desktop/) for your platform
- Clone or download repo
- Go to **app_python** folder
- Use `docker build ./ moscow_time` for building docker image
- Use `docker run -d -p 5000:5000 moscow_time:latest` for starting application
- Go to `http://127.0.0.1:5000` and look at current Moscow time
#### Start from ready image
- Install [Docker](https://www.docker.com/products/docker-desktop/) for your platform
- Use `docker pull alexdestdev/moscow_time:0.1` to get builded image
- Use `docker run -d -p 5000:5000 alexdestdev/moscow_time:0.1` for starting application
- Go to `http://127.0.0.1:5000` and look at current Moscow time
## Contact

<<<<<<< HEAD
#### For the first lab

1. Fork this repository.
2. Checkout to lab1 branch.
3. Complete lab1 tasks.
4. Push the code to your repository.
5. Create a PR to the lab1 branch on this repository from your fork's lab1 branch.
6. Create an archive with the current version of your code and submit a zip file to Moodle.
7. Create a team with with your classmates, 6 people max.
8. Each student must review PRs of all teammates.
9. Wait for your grade.

## Grading

### Points distribution for the course

```
70 - labs
20 - final exam
10 - attendance on lectures
```

### Grade ranges

```
[90;100] - A
[75;90)  - B
[60;75)  - C
[0;60)   - D
```

### Labs grading

Each lab is marked out of 10. All labs have a set of main tasks and a set of extra tasks.

Completing main tasks correctly will give you 10 points out of 10. Completing extra tasks correctly will give you some additional points, depends on the bonus task difficulty. Your points for main and extra tasks will be summed up and will help you to get a better grade.

If you finish all bonus tasks correctly the **permission to skip the exam will be granted to you + 10 extra points**. If you finish not all of them you will must pass the exam, but it can save you from the exam's failure.

## Deadlines and labs distribution

Participants have 2 new labs every week simultaneously and 1 week to submit solutions. Moodle will contain presentations and deadlines.

You are required to submit a zip file with your source code to corresponding assignment in moodle. This is required for the university as a proof of work.

## Submission policy

**Submitting results after the deadline will result in maximum of 6 points for the corresponding lab. As stated before, all labs must be submitted to pass the course.**
=======
Alexey Rakov, BS19-SD-01 \
email: a.rakov@innopolis.university
>>>>>>> lab2
