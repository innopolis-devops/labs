## python app best practices

1. separate environment for python projects by creating `virtual environment`
2. avoid writing single-letter variable names
3. use `requirements.txt` to list all the dependencies your code needs to work properly
4. create a `code repository` and implement `version control`
5. don’t implement best practices from other languages

## flask framework and why i used it
1. ~~idk it was on the first page of "python web app" google search~~
2. flask is a micro framework and is an excellent choice for building smaller applications, APIs, and web services
3. it  implements the most commonly-used core components of a web application framework
4. pros: scalable, flexible, lightweight, well-documented
5. cons: maybe not suitable for big apps, not many tools, security issues (while using third-party modules)

## linters
1. i used [black](https://github.com/psf/black) linter cuz it "makes code review faster by producing the smallest diffs possible"
2. nice logo huh
   ![](https://raw.githubusercontent.com/psf/black/main/docs/_static/logo2-readme.png)
3. cute message about formatting
   ![](https://i.imgur.com/jIjKCOD.png)

## unit test~~s~~
some best practices that i applied to my very first unit test!
1. write simple tests (5 lines of code without empty lines)
2. one assert per test method (so easy to follow when you have only one test method)
3. avoid test interdependence (so easy to follow when you have only one test)