## Best practices

1. Using Rust :)
2. Dockerizing the application
3. Using Makefile configuration
4. Managing timezones within the utils module
5. Managing dependencies with Cargo.toml
6. Locking the fixed versions of the dependencies (Cargo.lock)
7. Using Clippy linter

## Framework

### Overview

I wanted to try to write something on Rust for a long time, so I just used the opportunity, googled the frameworks, and bumped into Rocket

### Pros

The ones that I noticed developing myself, and researched online

1. Easy to use
2. Offers good querying support
3. Built-in templating support
4. Built-in testing library
4. Easy to scale an app
5. Quickly growing community
6. Type safe

### Cons

1. It uses an experimental development branch of Rust (i.e., Nightly)


## Linters

In spite of using only one linter, it fulfills all the needs. Probably, due to the fact that Rust has good built-in linting support.

### Clippy

A general-purpose linter (in fact, a collection of them) that checks whether your code follows some defined rules

You can check the list of the lints used by Clippy here: https://rust-lang.github.io/rust-clippy/master/index.html


## Tests

I used the standard rust testing library to write the unit tests for my project

There is only one endpoint that requires testing, that is the logic within the **current_time** endpoint. Using a mock client,
I have requested the resource, and checked that the response matching the expected pattern

Also, I followed these best practices

1. No "overtesting" — I did not test the libraries' logic, only the one I wrote myself
2. Adding a testing stage to the Github Actions workflow
3. Adding a testing command to the Makefile configuration
4. Writing it in Rust :)