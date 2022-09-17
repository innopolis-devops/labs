# CI best practices

+ split CI into logical parts: **LINT**, **TEST**, **PUSH**
+ Use dependencies for stages. should not do **PUSH** if **LINT** or **TEST** is failed
+ add filters for running your job. should run only there are changes in relevant files
+ add default timeout for your jobs. if job runs for hour it's not good
+ since we added job for linting, it's also good to add git-hook. I will use [pre-commit](https://pre-commit.com/). This script will check that my code is linted well and it will stop me from commiting without linting, so I won't run my CI/CD job for no reason.
+ use build cache