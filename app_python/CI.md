## CI/CD

For CI/CD I am using Github Actions. For python application, 
the workflow in described in [.github/workflows/app_python.yml](../.github/workflows/app_python.yml)

### Best practices applied
* Run CI only if there are changes in the project folder ```./app_python```
* No credentials in files. All sensitive tokens stored as Github secrets
* Set timeouts for all tasks in the workflows
* No usage of self-hosted runners in the public repository
* Use of build cache while building docker image
* Keep actions minimal to save time
* Docker push stage is performed only if build & tests and security stages are passed
