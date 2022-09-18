# Best practices for CI

* Docker image build & publish is triggered by semver-formatted tags (it makes sense not to do this each push)
* Docker image tag is parsed from the formatted tag automatically
* Lint markdown files in the workflow (so that we won't rely on local checks)
* Use condition on running a job to prevent duplicate runs (e.g. on pull requests from lab* to master)
* Use cache
* Use GitHub's secret storage
* Set timeout shorter than default 6 hours (too big for us)
* Use official/trusted actions
* Restrict workflows with permissions (least privelege)
* Disabled "Allow edits and access to secrets by maintainers" in third-party repo's PR in order to avoid revealing my docker hub token to the maintainers :)
* Automatically upload security reports to GitHub
* Reuseable workflows to avoid code duplication
* Trigger on changes to appropriate files/folders
