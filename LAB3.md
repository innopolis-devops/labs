# 3

## Continuous integration

### 6 points

1. Code testing

   * Read about best practices.
   * Write unit tests for your application.
   * Update a PYTHON.md ﬁle and describe your unit tests and best practices that you applied.
   * Update a README.md ﬁle, add a "Unit tests" part.

2. Set up Git Actions CI

   * Create a continuous integration (CI) workflow to [build and test your Python project](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python).
   * It must have at least 3 steps Dependencies, Linter and Tests.
   * Add [Docker related steps](https://docs.docker.com/ci-cd/github-actions/) into your workflow.
   * It must have at least 2 steps Login, Build & Push.
   * Update a README.md ﬁle.

3. Create a PR to the forked repo lab3 branch, ask your teammates to review it and review PRs of your teammates.
   > If you didn't join any team, please do, we will provide extra points for good reviews. And something special for the best team. But as it's extra it is not mandatory.
4. **Create a PR in your own repository from the lab3 branch to the lab2 one.** It will help us with grading.


### 4 more points

1. Improvements:

   * Add a workﬂow status badge.
   * Read about best practices.
   * Optimize it, use a build cache.
   * Create a CI.md and provide best practices that you applied.
   * Implement Snyk to check your projects for vulnerabilities. [Python example.](https://github.com/snyk/actions/tree/master/python-3.8)

## Bonus

### 4 extra points

1. Follow steps from the main task for your extra app, [examples](https://github.com/actions/starter-workflows/tree/main/ci).
2. Improve your CI workflows:
   1. the Python app CI should run only if there are changes in the `app_python` folder
   2. the extra `<language> app` CI should run only if there are changes in the `app_<language>` folder

## Out of the bonus

This task is not required to skip the exam, but can provide you more points.

### 6 extra points

Set up a CI process via any another CI tool.
