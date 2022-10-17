# Best practices

- Use a build cache. I use cache for Docker image and Python dependencies.
- Run the job only if there are changes in the `app_python` folder. I
  used [paths-filter](https://github.com/dorny/paths-filter) action.
- Separate steps into different jobs. I have several jobs: `build`, `security`
  and `publish-image`.
- Keep your Actions minimal. I used actions only specific to the lab tasks.
- Don’t install dependencies unnecessarily. I used dependencies only from the
  [requirements.txt](requirements.txt) file.
- Never hardcode secrets. I used variables for pushing the Docker image and
  running the Snyk task.
- Limit environment variables to the narrowest possible scope.
  I didn't use variables :)
- Ensure every repository contains a CI/CD workflow. For the python app,
  I created a specific workflow `python-ci.yml`
- Don’t use self-hosted runners in a public repository.
- Set timeouts for workflows. I set 10 minutes for each job.

Sources:

- [github-actions-best-practices](https://www.datree.io/resources/github-actions-best-practices)
- [gha-best-practices](https://exercism.org/docs/building/github/gha-best-practices)
