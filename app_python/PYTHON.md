# Python
## Unit tests
Unit tests are written in `./hw1/hw1/tests/` module, and it tests the only function in `utils.py`. I mocked `requests.get` function to examine behaviour of the function when different status codes are received.

I used `unittest.mock.patch` decorator to mock `requests.get`, and default django testing module.