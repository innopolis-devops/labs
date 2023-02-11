I chose [Bottle](https://bottlepy.org/docs/dev/) framework, because it really suits to the task: 
# Pros

## Simplicity and availability
You can easily start to work with this framework, just one command, import bottle and very simple syntax - you already can create your first simple web-application. Also, this framework is well-documented

## Speed
Due to the its small size, no external dependencies and optimization it's faster than so-called 'megaframeworks'

# Cons

## Not really expendable
This framework is not really effective for creating medium-size and bigger applications, because you will need to do some work (install external dependencies) to get to the point, where frameworks like Django start.

## Community
Community of Bottle is smaller significantly than community of mainstream frameworks like Django or Flask.

# Conclusion
This framework is completely suitable for my educational purposes

# Best practices

## Linter
I installed linter so I can keep my code clean, ensure it's a valid Python code and follow recommended Python-code style. I used flake8 and flake8 plugin for markdown.

## Unit tests
For unit tests I used simple but powerful Python framework pytest. 
There are tests for application itself as well as for the format of the provided datetime string.
Best practices I applied:
- Tests are fast
- Tests don't depend on any external services or APIs
- Tests are written in details, so it is easy to understand them

Additionally, I followed Flask [documentation](https://flask.palletsprojects.com/en/2.2.x/testing/) for testing.