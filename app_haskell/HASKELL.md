# Haskell application best practices

* Use version control system (git)
* Use dependency management tool (stack)
* Follow style guidelines (hlint)
* Use libraries from Hackage
* Use appropriate .gitignore file
* Use pre-commit
  * hlint           - linter
  * stylish-haskell - auto code formatter
* Use production ready libraries
  * servant - most popular library for building REST APIs.
    Can be used for serving HTML too (our case).
    * Pros
      * Type safe library, which checks your API against it's type.
      * Auto tests can be generated for your implementation.
      * Supports streaming, automatic de/serialization and other usual things for web library.
      * Can automatically generate clients for your API.
    * Cons
      * Extending library functionality (for example, writing new combinators)
        for programmers, who are not familiar with type-level programming will
        be not so easy.
* Use Makefile
* Turn all warnings to errors
