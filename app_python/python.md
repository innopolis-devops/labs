## Python best practices

### 1. Create readable code:

In my code it is simple to understand what happens, since code is readable and pretty much self-explanatory: from `@app.get('/time/moscow')` we can understand, what the route should do, variable names let developer quickly understand what code in function should do, and returning a JSON object in response allows people using our APIs understand, what to expect from this route.

### 2. Use Version Control System

This code will be uploaded to Github. To make installation process easier, all dependencies are listed in __requirements.txt__

### 3. Writing documentation for code

There should be an option to understand what the code does without having to read it, especially in big projects. In python, it could be achieved using docstrings for function and by using something like Swagger for describing APIs if we write backend applications.

### 4. Writing modular code

There should be a separation in code between business logic, internal operations with databases and user interfaces (APIs). For example, one can use Model-View-Controller architecture to separate models, which manage the data directly, views, which represent the data in some way, and controllers, which makes queries for data and manipulates it for views.

### 5. Use virtual environments

To avoid cluttering the dependencies by using same environment across different projects, it is good to use virtual environments to separate projects and thus dependencies. Virtualenv or Pipenv are good examples of such virtual environments.

## Framework selection

For this excercise, I've chosen Flask. My choice was motivated by both the volume of this task and the production readiness of Flask. It allows to write something simple with the minimum amount of lines of code (my code could be reduced to only 12 lines, if all empty lines would be removed). However, if there would be a need to scale app, there is a great amount of plugins for Flask, which allow us to extend the functionality of Flask while maintaining the same readability and ease of developing. Also, it is used by companies such as Netflix, Reddit, Uber etc.

## Linter choice

I have chosen Pylint because it is a well-developed linter with wide functionality which allows to detect and correct a lot of things in my code, which can be useful in case this project will scale up.

# Testing 

Since I have unit tests, I refactored the code a little and put the logic of getting Moscow time into `time_controller.py`. I will test the resulting function (`time_controller.get_moscow_time()`) in my unit tests. I will use the `pytest` library. 

## Best practices I used

For my unit test I did not have much opportunity to use a lot of practices, however I created a scalable directory structure for tests, with the division of test into units and unit-tests inside, however in the future I'll be able to create other tests, such as route or stress tests in the same `tests/` directory. Also, I followed the practice of testing a single thing in a test, so I created two tests: first checks that my date string is in ISO format, second checks that the date created is correct by comparing it against Moscow timezone date.