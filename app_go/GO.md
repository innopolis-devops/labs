# Go Best Practices

* Write README file to give additional context about the project
* Use linters to automate clean code practices python projects
* Use .gitignore file
* Keep package main small as possible
* Use gofmt
* Variable names in Go should be short rather than long

## Framework choice - net/http

### Pros

* It is standard built-in package
* Simple
* Robust
* Performant

### Cons

* Not much functionality

## Linters choice

* For go: [golangci-lint](https://golangci-lint.run/usage/install/)
* For markdown: [Markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

## Unit tests
**Description**: There is unit test in projects implemented using pytest. I checked correctness of updating.

**Best practises**:

* Go testing files are always located in the same folder, or package, where the code they are testing resides
* Use interface for testing
* Use beautiful tool for showing test coverage
