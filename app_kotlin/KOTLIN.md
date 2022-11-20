# Best practices that I applied

- Add unnecessary generated files in `.gitignore` to not accidentally push them.
- Separate logic by different functions instead of writing everything
  in the main function.
- Move functionality into separate files to follow the MVC paradigm.
- Write unit tests for implemented functions.
- Separate test files and source files in different packages.
- Follow SOLID principles.
- Follow dependency injection via the usage of Beans.
- Use `detekt` to check kotlin code.
- Use Markdown lint to check markdown files.

## Spring

I chose this framework since it is one of the most popular frameworks

### Pros

- It is lightweight
- It is flexible: a lot of libraries

### Cons

- Complexity: it uses a lot of additional frameworks and libraries.
  So, you need to study a lot to understand how it
  works under the hood

## Unit tests

- For unit tests, I chose the `junit 5` library since it's convenient for me.
- To run all tests just cd into the **app_kotlin** folder and use this command:
  `./gradlew test`
- I placed simple unit tests in **TimeServiceTest.kt** file.
  They check the Moscow Time retrieving: time interval
  (that time is really updated each second) and HTML web page content.
- **Best practices**
   - All files should be named ending with `Test`.
   - Preserve the same package structure in the **test** folder as in **main**.
   - Each unit test class should test only corresponding functionality to that class.
   - Place test files into a separate folder. In my case, it is the **test** folder.
   - A testing unit should focus on one tiny bit of functionality and prove it correct.
   - Each test unit must be fully independent.
   - Always run the full test suite before a coding session.
   - Use long and descriptive names for testing functions.
   - Use Mocks

## Linters

- to check the Kotlin code I used
  [Detekt](https://github.com/detekt/detekt) plugin
   - Add this plugin in Gradle: `id("io.gitlab.arturbosch.detekt") version "<current_version>"`
   - Check: run `./gradlew detekt`

- to check markdown files I used
  [Markdown lint](https://github.com/markdownlint/markdownlint) tool
   - Install: `rake install`
   - Check: `mdl app_kotlin`
