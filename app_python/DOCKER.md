# Best practicies

## 1. Run dockerfile as non-root user

Now the dockerfile is creating a new user.
And runs as it user.
The only thing is that running the requirements
(installation) can be done only by the root user.

## 2. Using linter to awoid some mistakes

For checking Dockerfile the
[hadolint](https://github.com/hadolint/hadolint) linter was used.
Check can be done locally by installing the tool as described in link above
and running it in the folder with dockerfile as

```bash
hadolint dockerfile
```

In this project it also integrated to github actions.
