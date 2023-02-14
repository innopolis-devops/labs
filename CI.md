# Best CI practices 

In this CI process I used the following best practices:

- Separating test, installing and linting stages into steps with names
- Separating docker publishing and python setup into different jobs
- Using secrets instead of putting private data
- Use caching according to [this](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python#caching-dependencies) step of the guide.