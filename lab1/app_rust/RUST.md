## Best practices

1. Using Rust :)
2. Dockerizing the application
3. Using Makefile configuration
4. Managing timezones within the utils module
5. Managing dependencies with Cargo.toml
6. Locking the fixed versions of the dependencies (Cargo.lock)

## Framework

### Overview

I chose Rocket, because I have always wanted to have my hands on Rust :)

### Pros

The ones that I noticed developing myself, and checking the opinions online

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

I used only one linter, and it is Clippy. Also, Rust has good build in linting support.

### Clippy
A general-purpose linter that checks whether your code follows the stylistic rules
