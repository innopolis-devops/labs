# Rust best practices

- Framework: [`rocket`](https://rocket.rs/)

  - Pros
    - > Rocket is a web framework for Rust that makes it simple to write fast, secure web applications without sacrificing flexibility, usability, or type safety.
    - > Type Safe
    - > Boilerplate Free
    - > Easy To Use
    - > Extensible
  - Cons
    - to build with stable toolchain rc version of the framework is required

- Use `rustfmt` to format the code
- Use `clippy` to lint the code
- Use pre-commit hooks to lint the files
- Perform unit tests for the app
  - Use `cargo test`

## Unit tests

- Tests that the app returns the current time in ISO format
