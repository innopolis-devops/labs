# Rust-specific info

## Best practices

* Added [.gitignore](https://github.com/github/gitignore/blob/main/Python.gitignore) file recommended for rust
* Wrote configuration for docker image, so that users won't need to create venv, install dependencies, etc. manually
* Passed the code through [Clippy](https://github.com/rust-lang/rust-clippy) rust linter (widely used in Rust development) and `.md` files through [Markdown linter](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
* Use `.dockerignore`
* Actual docker image that the resulting binary is ran on is based on distroless linux image. It makes image size extremely small (11.4 MB compared to 896 MB Python image and 1.31 GB Rust image), since we don't include stuff unnecesary for our server to run.
* Docker buildkit is used that allows to mount cache folders into a temporary image used for building the binary. It allows to not expect the target image to build Rust programs and to not recompile everything from scratch on each small change (with the help of Rust incremental compilation capabilities).

## Framework choice

I chose Rocket Rust framework because Rust is very suitable option for network applications (memory safety, strict compiler policy, etc.) and Rocket is a framework that gets needed work done.

### Pros

* Simple
* Production-ready
* Enough for us

### Cons

* Version used is a "Release candidate", which is not the best option for production server. However, we are not expected to maintain the server (it's basically hello world), so it should work for us.

## Unit test best practices

* Repeatable tests
* Functions that are tested do one small thing (kind of like Unix's "do one thing well" :P)
* Test one function at a time
* Test with various inputs (including edge cases)
* Testing data initialized in separate function
* Avoid global variables
* Use mock implementations where applicabe (not in our case)
* Descriptive names of test functions
* Automated tests
* Test cases are easily extendable
* Concise tests: test cases parsing and other technical stuff is moved to other functions so that reading the test does not distract from the cases, functionality tested, and validation logic.
