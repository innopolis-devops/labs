# Motivation and explanation of chosen stack

## Best practices

* add development files, that are nmot supposed to be pushed to .gitignore
* use Docker for development and production
* use virtualenv for development

## Python framework

I have chosen **Flask** framework because it is very popular and easy to start with.

### Pros

* It is very flexible and easy.
* Good for unit testing.

### Cons

* Not easily scalable. (it has a singular source which means that it will handle every request in turns, one at a time).
* More potential for security risks. (when using 3rd party modules for example).

## Linting

### Python linting

I have chosen the **Pylint** module for linting my python code. It is a very popular module and it is easy to use.

### Markdown linting

I have chosen the **markdownlint** module from [Markdown All in One VS Code plugin](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) for linting my markdown files. It is a very popular module and it is easy to use.

## Testing

### Python unit-tests

I have written unit-tests for my python code using the **unittest** module. It is a very popular module and it is easy to use.

I have come up with a single test that ensures that the time string displayed on the website shows time within one second of the current time.

#### Best practices used

* Readable and simple
* One scenario per test
* Isolated
* No API calls
* No test interdependence
