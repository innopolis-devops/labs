# Best practices.

1. I do not use docker-actions (AWS ECR actions) to avoid dependency on GitHub. Instead of it I use usual cli commands
that are predefined in Makefile. If, if you have to migrate your repo to another CI or git (i.e. gitlab) you can 
easily use same make commands without any pain.

2. Add `paths` option to CI, to be able to skip CI if files not changed.

3. Use dependency (`needs` in GitHub) to run builds only if lint and test section are passed.

4. Push docker images only from master branch, after pull request. Build docker images only on pull requests. And use 
test and lint on every push. In this way you can avoid unnecessary images/builds but keep repo clean (because of lint)
and working (because of tests).

5. Hide tokens (AWS in my case) into repository secrets.

6. You can pull images before building to be able to use cache from it, but you need to use buildx and some additional
steps (because I use makefile instead of github-actions). Better to use your own runner, and save cache locally.
It's more secure and faster.

8. You can use Snyk directly from ECR (as I know), so I do not use it in CI/CD.
