# Current time in Moscow / Web Application #

## Introduction ##

This is Python Web Application, that shows current time in Moscow

## Getting Started ##

To install all dependencies that used in this project you need to run following command:

```text
pip install -r app_python/requirements.txt
```

Then run the project using this command:

```text
cd app_python
flask run --host=127.0.0.1 --port=4000
```

## Check Results ##

Go to `http://127.0.0.1:4000` web page to see the result


## Getting Started with Docker ##

1. Install Docker
2. Pull image:
```docker pull dapp7anyway/devops```
3. Run container:
```docker run -p 4000:4000 dapp7anyway/devops```


# Unit tests #

I used ```pytest``` for running tests. I followed several best practices:

* Clear test function name: The name of the test function, test_get_time, is clear and descriptive. It conveys the intent of the test and what it's testing.
* Arrange-Act-Assert (AAA) structure: The test function follows the AAA structure, where we first set up the necessary objects (arrange), then perform the action being tested (act), and finally check the expected result (assert).
* Isolation of code under test: The test only tests the behavior of the get_time function and does not rely on any external resources or dependencies.
* Use of test client: We use Flask's test client to simulate requests to our app, instead of making actual HTTP requests. This makes our tests faster and more reliable.
* Use of assertions: We use assert statements to check that the actual results match our expected results. This makes it easy to identify when a test fails and what went wrong.

Overall, these practices help make our tests more readable, maintainable, and reliable.