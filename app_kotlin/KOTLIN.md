# Best practices that I applied

- Add unnecessary generated files in `.gitignore` to not accidentally push them.
- Separate logic by different functions instead of writing everything
  in the main function
- Move functionality into separate files to follow the MVC paradigm
- Write unit tests for implemented functions
- Follow SOLID principles
- Follow dependency injection via the usage of Beans
- Use `ktlint` to check kotlin code
- Use Markdown lint to check markdown files

## Spring

I chose this framework since it is one of the most popular frameworks

### Pros

- It is lightweight
- It is flexible: a lot of libraries

### Cons

- Complexity: it uses a lot of additional frameworks and libraries.
  So, you need to study a lot to understand how it
  works under the hood

## Linters

- to check the Kotlin code I used
  [Ktlint Gradle](https://github.com/JLLeitschuh/ktlint-gradle) plugin
   - Add this plugin in Gradle: `id("org.jlleitschuh.gradle.ktlint") version "<current_version>"`
   - Check: run `ktlintCheck` gradle task

- to check markdown files I used
  [Markdown lint](https://github.com/markdownlint/markdownlint) tool
   - Install: `rake install`
   - Check: `mdl README.md`
