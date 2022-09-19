# Python

## Best practices

1. **Use Version Control System (VCS)**. Even though it is impossible to complete the task without using Git,
I generally use VCS in every project of mine.
2. **Write a README file**. The README has general information about the app,
such as how to install and run it.
3. **Have requirements.txt file**. This file contains a set
of dependencies of the application and is essential for someone to run the project.
4. **Compliance with PEP8 code style**. PEP8 is a standard guideline for python code.
5. **Use a linter**. Linters are programs
that assist more readable and error-prone code by analyzing its structure.

## Framework of choice: FastAPI

1. **Small**. This is the main reason why I chose this framework.
It takes a dozen of lines to write a backend app.
2. **Easy**. This is quite essential for an educational project,
as I have no experience with python frameworks.
3. Still **Fast** and **Robust**. Despite the above, it is a production-ready framework
for implementing high-load backend applications.

## Python linter

I used [pylint](https://pypi.org/project/pylint/). It is listed in the requirements.txt,
so you should be able to run it.

```
pylint main.py
```

## Markdown Linter

I used [markdownlint](https://github.com/markdownlint/markdownlint). This file is formatted according to the linter.

## Unit Tests
I put a single test in `test_main.py` file. This test checks that the `get_current_time()` method (which is the only method in the app) is functioning and returns a successful response.

I used `pytest` library for unit testing.

### Best practices
1. Simple tests. The test is very simple and verbose: it just checks that the response is successful and that the required field is present in the response.
2. Test one functional unit per each test. It's rather simple to follow, as the application has *only* one functionality :)
3. Test should not duplicate implementation. That is why I did not check the correctness of the time in the response.
4. Integrate automated testing to CI/CD pipeline. I run unit tests on every push to the target branch to ensure code correctness.
