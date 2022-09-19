# Python Best Practices

* Write README file to give additional context about the project
* Use linters to automate clean code practices python projects
* Use .gitignore file
* Use naming convention
* Write requirement.txt file with versions
* Use virtual environment

## Framework choice - Flask

### Pros
* Simple for our goal
* Flexible

### Cons
* Too simple

## Linters choice

* For python: [Black](https://github.com/psf/black)
* For markdown: [Markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

## Unit tests
**Description**: There is unit test in projects implemented using pytest. I checked format of the time string and correctness of updating.

**Best practises**:

* Write tests inside separate directory "tests" for better architecture of a project
* Describe your test in docstrings inside each test for better maintenance of code
* Use decorator @pytest.mark.parametrize() to pass test data to test function without writing loop
* Use pytest module for testing, because it has better organization of results
