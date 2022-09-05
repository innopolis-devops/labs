# PHP

## Best practices

1. **Use Version Control System (VCS)**. Even though it is impossible to complete the task without using Git,
   I generally use VCS in every project of mine.
2. **Write a README file**. The README has general information about the app,
   such as how to install and run it.
3. **Use a linter**. Linters are programs
   that assist more readable and error-prone code by analyzing its structure.

## Framework of choice: Laravel

1. **Familiar**. This is the main reason why I chose this framework.
   I have some experience with it.
2. **Easy to set up**. Using `artisan` cli tool, laravel projects become very easy to manage.
3. **Powerful**. This framework allows programmers to do numerous things quite easily.

## PHP linter

I used [php_codesniffer](https://github.com/squizlabs/PHP_CodeSniffer). It is listed in the dependencies,
so you should be able to run it.

```
./vendor/bin/phpcs .
```

Note: generally you don't need to run it explicitly, as it is perfectly integrated in PHPStorm. 

## Markdown Linter

I used [markdownlint](https://github.com/markdownlint/markdownlint). This file is formatted according to the linter.
