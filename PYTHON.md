# Framework

## FastAPI

### Pros

Here is the most important features for this 
project, complete list can be found on
https://fastapi.tiangolo.com/

Easy - no need a lot of time to study it, 
good documentation, a lot of information about it 
due to big popularity

Robust - get production-ready code, with automatic
documentation

Standards-based - based on (and fully compatible with) the open standards for APIs

### Cons

Crowded main file - as everything tied to FastAPI app, the main file
tend to be crowded

Relatively new framework - it is a popular framework, but since it
is much newer than, for example, Django and Flask, it may have less
community, tutorials, books, or courses

# Additional packages

## pytz

This library allows accurate and cross-platform timezone calculations.
it is used to ensure that application is showing correct time. If we
would simply return `datetime.now()`, when it would work incorrectly on 
computers with system time in other timezone

# Linter - flask8

## Usage

Type

`flake8 app_python/main.py` in terminal